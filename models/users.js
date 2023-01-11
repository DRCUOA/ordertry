const SQL = require("sql-template-strings");
const dbPromise = require("../database/database.js");
const moment = require("moment");

/**
* @param user, the user to insert into the database 
*/

async function createUser(user) {
  const db = await dbPromise;

  const result = await db.run(SQL`INSERT INTO app_users (username, email, password, created_at) VALUES (
    ${user.username},
    ${user.email},
    ${user.password},
    ${user.created_at});`);

    // get the id generated by the db and assign it back to the user object
    user.id = result.lastID;
};

module.exports = {
  createUser
  // retrieveAllUsers,
  // retrieveUserWithAuthToken,
  // retrieveUserWithUsername,
  // retrieveUserWithEmail,
  // updateUser
  //retrieveUserById,
  //retrieveUserWithCredentials,
  //deleteUser
};


