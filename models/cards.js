const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespace
const devCardDAO = debug('devLog:cardDAO');

async function getdocIdByQid(q_id) {
  const db = await dbPromise;
    try {
      const docId = await db.all(SQL`
        SELECT docs_id
        FROM n_docs
        WHERE q_id = ${q_id}`)
        
      return (docId[0].docs_id - 1); // minus to return index value as docIds start from 1
    } catch (err) {
      devCardDAO(err)
    }
}

//get video tutourial link
async function getTLinkByQid(q_id) {
  const db = await dbPromise;
    try {
      const tutorialId = await db.all(SQL`
        SELECT tutorial_id
        FROM n_tutorials
        WHERE q_id = ${q_id}`)
        
      return (tutorialId[0].tutorial_id - 1); // minus to return index value as Ids start from 1
    } catch (err) {
      devCardDAO(err)
    }
}


// get all cards
async function getAllCards() {
  devCardDAO("retreiving all cards");
  const db = await dbPromise;
    try {
      
      const questionsData = await db.all(SQL`
      SELECT * 
      FROM n_questions;`);
      // devCardDAO('Retrieve questionsData', questionsData);
      
      const optionsData = await db.all(SQL`
      SELECT *
      FROM n_options`);
      // devCardDAO('Retrieve optionsData', optionsData);

      const docs = await db.all(SQL`
      SELECT *
      FROM n_docs`);
      // devCardDAO('Retrieve Docs', docs);

      const tutorials = await db.all(SQL`
      SELECT * 
      FROM n_tutorials`);
      devCardDAO('Retrieve Tutorials', tutorials);

      const questions = createJSONObject(questionsData, optionsData, docs, tutorials);

      return questions;

    } catch (err) {
      devCardDAO(err);
      return err;
    }
  }  

  async function createJSONObject(questions, options, docs, tutorials) {
    let newJSON = { "questions": [] };
  
    for (let i = 0; i < questions.length; i++) {
      let question = questions[i];
      let questionOptions = [];
    
      for (let j = 0; j < options.length; j++) {
        let option = options[j];
  
        if (option.q_id === question.q_id) {
          questionOptions.push(option.option_text);
        }
      }

      let docIndex = await getdocIdByQid(question.q_id)
      
      let tutorialIndex = await getTLinkByQid(question.q_id);

      devCardDAO(tutorialIndex);
      
      let newQuestion = {
        "question_id": question.q_id,
        "question": question.question,
        "options": questionOptions,
        "documentation_link": docs[docIndex].doc_link,
        "video_link": tutorials[tutorialIndex].tutorial_link
      };
      newJSON.questions.push(newQuestion);
    }
  
    // devCardDAO('Question Generated:', newJSON);
    return newJSON;
  }
  

module.exports = {
  getAllCards
}