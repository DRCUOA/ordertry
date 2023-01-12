const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");
const debug = require('debug');

// debug namespaces
const devUserDAO = debug('devLog:userDAO');

/**
* @param user, the user to insert into the database 
*/

async function createUser(user) {
  devUserDAO("attempt dao function");

  const db = await dbPromise;

  const created_at = moment(new(Date)).format('YYYY-MM-DD HH:mm:ss');

  const result = await db.run(SQL`INSERT INTO app_users (username, email, password, name, created_at) VALUES (
    ${user.username},
    ${user.email},
    ${user.password},
    ${user.realName},
    ${created_at});`);
    // get the id generated by the db and assign it back to the user object
    user.id = result.lastID;
    devUserDAO(user.id)
    return user
};

module.exports = {
  createUser
};

