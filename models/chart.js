const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespaces
const devChartDAOLog = debug('devLog:chartDAO');

async function getBgReadingsAll(attributes) {

  const db = await dbPromise;

  devChartDAOLog(`getBgReadingsAll call at timestamp: ${queryTimeStamp = moment(new (Date)).format('YYYY-MM-DD HH:mm:ss')}`);
  const rows = db.all(SQL`SELECT BG, device_timestamp FROM bgReadings`);

  return rows;

};

module.exports = {
  getBgReadingsAll
}