/**
 * User-app
 * V0.0.1
 * Author: Richard Clark
 * Licence: MIT
 * Copyright: nzwebapps
 */

// setup express server, app and PORT variables
const express = require('express');
const app = express();
const cors = require("cors");
const multer = require("multer");
const port = process.env.PORT || 5001;

// enable dev dependecies for HTTP loggin and debug logs
const morgan = require('morgan');
const debug = require('debug');

// debug namespaces
const devApp = debug('devLog:App');
devApp('dev logs enabled');

app.use(morgan('tiny'));

// Enable CORS
app.use(cors());

// setup cookieParse
const cookieParser = require('cookie-parser');
app.use(cookieParser());

//enable urlencoding
app.use(express.urlencoded({extended: true}))

// make a folder available to serve static files
const path = require('path');
app.use(express.static(path.join(__dirname, "public")));

// setup view engine
const exhbs = require('express-handlebars');
const hbs = exhbs.create({
  defaultLayout: 'main',
  partialsDir: './views/partials'
});
  app.engine('handlebars', hbs.engine);
  app.set('view engine', 'handlebars');

// setup middleware
const { toaster } = require("./controllers/toaster");
app.use(toaster);

const { addUserToLocals, verifyAuthenticated } = require("./controllers/auth-middleware");
app.use(addUserToLocals);

app.get('/', verifyAuthenticated, (req, res) => {
      res.render('homepage', {pageTitle: "Welcome"})
});

// Set up multer for file uploads
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads");
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString() + file.originalname);
  },
});
const upload = multer({ storage });

// setup routes
const authRoutes = require("./routes/auth-routes");
app.use('/', authRoutes);

const clientInputValidation = require('./routes/clientInputValidationRoutes');
app.use('/validation', clientInputValidation);

// start the server runnign:
app.listen(port, () => {
  devApp(`User-db version 0.0.1 | App Listening on port ${port}`)
});