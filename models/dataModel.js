const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');
const csv = require("csv-parser");

// debug namespaces
const devDataModelDAO = debug('devLog:dataModelDAO');

exports.loadData = async (filePath) => {
  // Open the database connection using the dbPromise object
  const db = await dbPromise;

  // Read data from the CSV file
  fs.createReadStream(filePath)
    .pipe(csv())
    .on("data", async (data) => {
      // Insert data into the database using the sql-template-strings package
      await db.run(SQL`
        INSERT INTO data (
          Device,
          SerialNumber,
          DeviceTimestamp,
          RecordType,
          HistoricGlucose,
          ScanGlucose,
          NonNumericRapidActingInsulin,
          RapidActingInsulin,
          NonNumericFood,
          Carbohydrates,
          CarbohydratesServings,
          NonNumericLongActingInsulin,
          LongActingInsulinValue,
          Notes,
          StripGlucose,
          Ketone,
          MealInsulin,
          CorrectionInsulin,
          UserChangeInsulin
        ) VALUES (
          ${data.Device},
          ${data.SerialNumber},
          ${data.DeviceTimestamp},
          ${data.RecordType},
          ${data.HistoricGlucose},
          ${data.ScanGlucose},
          ${data.NonNumericRapidActingInsulin},
          ${data.RapidActingInsulin},
          ${data.NonNumericFood},
          ${data.Carbohydrates},
          ${data.CarbohydratesServings},
          ${data.NonNumericLongActingInsulin},
          ${data.LongActingInsulinValue},
          ${data.Notes},
          ${data.StripGlucose},
          ${data.Ketone},
          ${data.MealInsulin},
          ${data.CorrectionInsulin},
          ${data.UserChangeInsulin}
        )
      `);
    })
    .on("end", async () => {
      // Close the database connection
      await db.close();
    });
};