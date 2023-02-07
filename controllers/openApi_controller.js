const axios = require("axios");
const debug = require('debug');

// debug namespace
const devCtrllr_OpenApi = debug('devLog:openApi');

const openaiApiKey = process.env.OPENAI_API_KEY;

async function completion (req, res) {
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

  try {
    const response = await axios({
      method: "post",
      url: "https://api.openai.com/v1/engines/text-curie-001/completions",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${openaiApiKey}`
      },
      data: JSON.stringify({
          max_tokens: 1900,
        temperature: 1,
      })
    });

    devCtrllr_OpenApi(response.data);
    // res.status(200).json({ result: response.data.choices[0].text });
    return response.data.choices[0].text;
  } catch(error) {
    // Consider adjusting the error handling logic for your use case
    if (error.response) {
      console.error(error.response.status, error.response.data);
      res.status(error.response.status).json(error.response.data);
    } else {
      console.error(`Error with OpenAI API request: ${error.message}`);
      res.status(500).json({
        error: {
          message: 'An error occurred during your request.',
        }
      });
    }
  }
}

module.exports = {
  completion
}