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
const port = process.env.PORT || 5001;

// enable dev dependecies for HTTP loggin and debug logs
const morgan = require('morgan');
const debug = require('debug');

// debug namespaces
const devApp = debug('devLog:App');
devApp('dev logs enabled');

app.use(morgan('tiny'));

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
// const { addUserToLocals } = require("./controllers/auth-middleware");
// app.use(addUserToLocals);

app.get('/', (req, res) => {
  if(res.locals.user) {
    const userId = res.locals.user.user_id;
    res.render("profile");
  } else {
    res.render('index')
  }
});

// setup routes
const authRoutes = require("./routes/auth-routes");
app.use('/', authRoutes);

// start the server runnign:
app.listen(port, () => {
  devApp(`User-db version 0.0.1 | App Listening on port ${port}`)
});