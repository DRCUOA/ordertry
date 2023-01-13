const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespaces
const devChartDAOLog = debug('devLog:chartDAO');
devChartDAOLog(queryTimeStamp = moment(new (Date)).format('YYYY-MM-DD HH:mm:ss'));

async function getBgReadingsAll(attributes) {
  if (!attributes.length || !Array.isArray(attributes)) { return JSON.stringify({}); } else {
    let sql = `SELECT * FROM bgReadings WHERE `;
    let values = [];

    attributes.forEach((attribute, index) => {
      if (index === 0) {
        sql += `${attribute} = ?`;
      } else {
        sql += ` AND ${attribute} = ?`;
      }
      values.push(attributes[attribute]);
    });

    let db = await dbPromise;

    return db.all(SQL(sql), values)
      .then((rows) => JSON.stringify(rows));
  }
};