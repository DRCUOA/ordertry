const express = require("express");
const router = express.Router();

const debug = require('debug');

// setup debug namespaces
const devChartRLog = debug('devLog:chartRLog');

// import dao required
const chartDao = require('../models/chart');

// Get data for chart
router.get("/chart-data", async (req, res) => {
  devChartRLog("GET /chart-data request")
  try {
    // Fetch data from database
    const attributes = ({"device_timestamp": "> '2022-01-01 00:00:00'"});
    const data = await chartDao.getBgReadingsAll(attributes);  
    devChartRLog(data)
    res.json(data);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error retrieving data for chart");
  }
});

module.exports = router;
