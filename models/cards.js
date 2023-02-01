const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespace
const devCardDAO = debug('devLog:cardDAO');

// get all cards

async function getAllCards() {
  devCardDAO("retreiving all cards");
  const db = await dbPromise;
  
  
    try {
      const questionsData = await db.all(SQL`
      SELECT * 
      FROM QUESTIONS;`);
  
      // devCardDAO(questionsData);

      const optionsData = await db.all(SQL`
      SELECT *
      FROM options`)

      // devCardDAO(optionsData)

      const questions = createJSONObject(questionsData, optionsData)

      return questions;

    } catch (err) {
      devCardDAO(err);
      return err;
    }
  }  

  function createJSONObject(questions, options) {
    let newJSON = { "questions": [] };
  
    for (let i = 0; i < questions.length; i++) {
      let question = questions[i];
      let questionOptions = [];
  
      for (let j = 0; j < options.length; j++) {
        let option = options[j];
  
        if (option.question_id === question.question_id) {
          questionOptions.push(option.option_text);
        }
      }
  
      let newQuestion = {
        "question_id": question.question_id,
        "difficulty_level": question.difficulty_level,
        "question": question.question,
        "options": questionOptions,
        "correct_option": question.correct_option,
        "explanation": question.explanation,
        "documentation_link": question.documentation_link,
        "video_link": question.video_link
      };
      newJSON.questions.push(newQuestion);
    }
    devCardDAO('Question Generated:', newJSON);
    return newJSON;
  }
  

module.exports = {
  getAllCards
}