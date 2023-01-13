const express = require("express");
const router = express.Router();

const debug = require('debug');

// setup debug namespaces
const devChartRLog = debug('devLog:chartRLog');

// import dao required
const chartDao = require('../models/chart.js');

// Get data for chart
router.get("/chart-data", async (req, res) => {
  try {
    // Fetch data from database
    const attributes = ({"Device_Timestamp": "?", "BG": "U"});
    const data = await chartDao.getBgReadingsAll(attributes);  
    res.json(data);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error retrieving data for chart");
  }
});

module.exports = router;
