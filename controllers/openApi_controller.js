const axios = require("axios");
const redis = require("redis");
const debug = require('debug');
// debug namespace
const devCtrllr_OpenApi = debug('devLog:openApi');
const openaiApiKey = process.env.OPENAI_API_KEY;
// Create a Redis client to connect to the Redis server
const redisClient = redis.createClient();
redisClient.on("error", (error) => {
  console.error(`Redis error: ${error}`);
});

async function completion(req, res) {
  if (!openaiApiKey) {
    res.status(500).json({
      error: {
        message: "OpenAI API key not configured, please follow instructions in README.md",
      }
    });
    return;
  }
  const prompt = req.query.prompt || '';
  if (prompt.trim().length === 0) {
    res.status(400).json({
      error: {
        message: "Please enter a valid prompt",
      }
    });
    return;
  }
  // Check if the conversation continuation token exists in Redis
  const conversationContinuationToken = await new Promise((resolve, reject) => {
    redisClient.get(req.query.user_id, (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });
  let data = JSON.stringify({
    prompt: prompt,
    max_tokens: 1900,
    temperature: 1,
  });
  if (conversationContinuationToken) {
    // If the conversation continuation token exists, use it for the request
    data.continuation = conversationContinuationToken;
  }
  try {
    const response = await axios({
      method: "post",
      url: "https://api.openai.com/v1/engines/text-curie-001/completions",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${openaiApiKey}`
      },
      data: data
    });
    devCtrllr_OpenApi(response.data);
    // Store the conversation continuation token in Redis
    redisClient.set(req.query.user_id, response.data.choices[0].continuation, (error) => {
      if (error) {
        console.error(`Error storing conversation continuation token in Redis: ${error}`);
      }
    });
    res.status(200).json({ result: response.data.choices[0].text });
  } catch (error) {
    // Consider adjusting the error handling logic for your use case
    if (error.response) {
      console.error(error.response.status, error.response.data);
      res.status(error.response.status).json(error.response.data);
    } else {
      console.error(`Error with OpenAI API request: ${error}`);
      res.status(500).json({
        error: {
          message: "Error with OpenAI API request"
        }
      });
    }
  }
}

module.exports = {completion};