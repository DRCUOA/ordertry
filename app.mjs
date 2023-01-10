import express from 'express';
import path from 'path';
import exhbs from 'express-handlebars';
import morgan from 'morgan';
import debug from 'debug';
import cookieParser from 'cookie-parser';
import { verifyAuth } from './controllers/auth.mjs';

//declare the application and port 
const app = express();
const port = process.env.PORT || 3000;

//set up debug namespaces
const devApp = debug('devLog:App');
const devMid = debug('devLog:Middleware');
const devRoutes = debug('devLog:Routes');
const devViews = debug('devLog:Views');
const devControllers = debug('devLog:Controllers');
const devModels = debug('devLog:Models');
devApp('dev logs enabled');

//set up HTTP request logging
app.use(morgan('tiny'));
devApp('HTTP logging on')

//set up location for static files
const __dirname = new URL(import.meta.url).pathname;
app.use(express.static(path.join(__dirname, 'public')));
devApp('static files available from public dir')

//set up view engine
app.engine('handlebars', exhbs.engine({
  defaultLayout: 'main',
  partialsDir: 'views/partials'
}));
app.set('view engine', 'handlebars');
devViews('Handlebars set as view engine')

//middleware helpers
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
devMid('cookier parser, json body and url encoding handler middleware running');


//routing setup
app.use("/", verifyAuth,(req,res) => {
  res.render('index');
});
devRoutes('index route set')

//start the server
app.listen(port, () => {
  console.log(`Users-App Running | V0.0.1 listening on port ${port}`);
});