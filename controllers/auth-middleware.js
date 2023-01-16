const express = require('express');
const router = express.Router();
const debug = require('debug');

// debug namespaces
const devAuthMLog = debug('devLog:AuthM');
// dao object import
const userDao = require("../models/users");

// add user to locals context
async function addUserToLocals (req, res, next) {
  devAuthMLog(`attempt to add user to locals  `)
  const user = await userDao.retrieveUserWithAuthToken(req.cookies.authToken)
  
  try {
    devAuthMLog('try res.locals.users')
      res.locals.user = user;
        if (user) {
          devAuthMLog(`User ${user.username} is active.`);
          next();
        } else {
          devAuthMLog('user is false, next() call')
        next();
        }
  } catch (err) {
      devAuthMLog(err)
  }
};

// verify if req is from an authenicated user
async function verifyAuthenticated(req,res,next) {
  if(res.locals.user) {
    next();
  } else {
    res.render("index", {pageTitle: "Welcome"});
  }
};


module.exports = {
  addUserToLocals,
  verifyAuthenticated
};