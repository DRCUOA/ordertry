const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const debug = require('debug');

// debug namespace
const devCardDAO = debug('devLog:cardDAO');

// get docId
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
      return 0
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
      return 0
    }
}

//get the answer for a particular question
async function getAnswer(q_id) {
  const db = await dbPromise;
    try {
      const correctOptionId = await db.all(SQL`
        SELECT option_id
        FROM n_answers
        WHERE q_id = ${q_id}`);  
      return correctOptionId[0].option_id - 1;
    } catch (err) {
      devCardDAO(err)
      return 0
    }
}

// check if the selected option is in the list of correct options
async function isAnswerOption(targetText) {
  const db = await dbPromise;
    try {
        const correctOptions = await db.all(SQL`
          SELECT n_options.option_text, n_answers.option_id
          FROM n_options
          INNER JOIN n_answers
          ON n_options.option_id = n_answers.option_id;`);
        if(correctOptions.some(option => option.option_text === targetText)) {
          return true;
        } else 
          return false;
    } catch (err) {
      devCardDAO(err)
      return false
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
      const optionsData = await db.all(SQL`
      SELECT *
      FROM n_options`);
      const docs = await db.all(SQL`
      SELECT *
      FROM n_docs`);
      const tutorials = await db.all(SQL`
      SELECT * 
      FROM n_tutorials`);
      const questions = createJSONObject(questionsData, optionsData, docs, tutorials);
      return questions;
    } catch (err) {
      devCardDAO(err);
      return err;
    }
  }  

  async function createJSONObject(questions, options, docs, tutorials) {
    let jsonQuestions = { "questions": [] };
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
      let answerIndex = await getAnswer(question.q_id);
      let newQuestion = {
        "question_id": question.q_id,
        "question": question.question,
        "options": questionOptions,
        "documentation_link": docs[docIndex].doc_link,
        "video_link": tutorials[tutorialIndex].tutorial_link,
        "correct_option": options[answerIndex].option_text,
        "correct_option_id": options[answerIndex].option_id
      };
      jsonQuestions.questions.push(newQuestion);
    }
    const shuffle = shuffleArray();
    jsonQuestions.questions = shuffle(jsonQuestions.questions);
    return jsonQuestions;
  }

module.exports = {
  getAllCards,
  isAnswerOption  
}

// helper function shuffle the order of the question cards
function shuffleArray() {
  return (array) => {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  };
}