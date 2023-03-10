const express = require('express');
const { verifyAuthenticated } = require('../controllers/auth-middleware');
const router = express.Router();

const debug = require('debug');

//set-up debug namespace
const devCardRLog = debug('devLog:cardRLog');

//import dao required
const cardDao = require('../models/cards');

// return all cards from the db
router.get("/card-scroll",  async function (req, res) {
  // make a call to dao to retreive cards
  const data = await cardDao.getAllCards();
  res.render('cards-scroller', data);
});

// return a subset of cards based on a dynamic search term provided in the request object
router.get("/card-scroll/search", async function (req, res) {
  const data = await cardDao.getAllCards();
  const regex = new RegExp(req.query.searchTerm, 'i');
  const filteredData = {
    questions: data.questions.filter(card => {
    return Object.values(card).some(val => {
      return typeof val === 'string' && regex.test(val);
    });
  })
};
  devCardRLog(filteredData)
  res.render('cards-scroller',filteredData);
});
  
router.get("/answer", async (req, res) => {
  const isAnswerOption = await cardDao.isAnswerOption(req.query.selected);
  devCardRLog(isAnswerOption);
  if(isAnswerOption) {
  res.send(isAnswerOption);
  } else
  res.send(false);
})

//question admin routes:
router.get("/questions", verifyAuthenticated, async function (req, res) {
  
});

module.exports = router;