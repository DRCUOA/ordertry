const express = require("express");
const router = express.Router();

const debug = require('debug');

// setup debug namespaces
const devChartRLog = debug('devLog:chartRLog');
// import dao required
const chartDao = require('../models/chart.js');



const db = require("../models");

// Get data for chart
router.get("/chart-data", async (req, res) => {
  try {
    // Fetch data from database
    const data = await db.BG.findAll({
      attributes: ["Device_Timestamp", "BG"],
    });
    res.json(data);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error retrieving data for chart");
  }
});

module.exports = router;
