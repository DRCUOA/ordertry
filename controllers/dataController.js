const dataModel = require("../models/dataModel");
const upload = require("../routes/dataRoutes").upload;

exports.uploadFile = (req, res) => {
  // Use the multer middleware to handle file uploads
  upload.single("file")(req, res, async (err) => {
    if (err) {
      return res.status(400).json({
        success: false,
        error: err,
      });
    }

    try {
      // Insert data into the database
      await dataModel.loadData(req.file.path);

      return res.status(200).json({
        success: true,
        message: "Data loaded successfully",
      });
    } catch (err) {
      return res.status(500).json({
        success: false,
        error: err,
      });
    }
  });
};


