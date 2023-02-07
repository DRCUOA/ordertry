const express = require('express');
const { verifyAuthenticated } = require('../controllers/auth-middleware');
const router = express.Router();
const completion = require("../controllers/openApi_controller");
const cardDAO = require("../models/cards")


router.get('/prompt', verifyAuthenticated, async (req, res) => {
  res.render('completion')
});

router.get('/completion', async (req, res) => {
  const result = await completion.completion(req, res);
  if (result) {
    const q_id = cardDAO.createQuestion(result);
    res.render('completion', { result: result });
  }
});

module.exports = router;