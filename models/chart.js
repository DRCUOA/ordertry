const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespaces
const devChartDAO = debug('devLog:chartDAO');
