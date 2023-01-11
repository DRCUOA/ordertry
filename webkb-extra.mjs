










async function createUser(user) {
    
    const db = await dbPromise;

    const result = await db.run(SQL`
    insert into users (firstName, lastName, username, password, email) values
    (${user.firstName}, ${user.lastName}, ${user.username}, ${user.password}, ${user.email})`);

    // Get the auto-generated ID value, and assign it back to the user object.
    user.id = result.lastID;
}

// Get all users currently in the database

async function retrieveAllUsers(){
    const db = await dbPromise;

    const users = await db.all(SQL`
        select user_id, username from users`);
    
    return users;
}

/**
 * Gets the user with the given username from the database.
 * If there is no such user, undefined will be returned.
 * 
 * @param {string} username
 */

async function retrieveUserWithUsername(username) {

    const db = await dbPromise;

    const user = await db.get(SQL`
        select * from users
        where username = ${username}`);
    
    return user;
}

/**
 * Gets the user with the given email from the database.
 * If there is no such user, undefined will be returned.
 * 
 * @param {string} email
 */

async function retrieveUserWithEmail(email) {

    const db = await dbPromise;

    const userEmail = await db.get(SQL`
        select * from users
        where email = ${email}`);
    
        return userEmail;  
}

/**
 * Updates the given user in the database, not including auth token
 * 
 * @param user the user to update
 */
    async function updateUser(user) {
        
        const db = await dbPromise;
        await db.run(SQL`
        update users
        set 
        authToken = ${user.authToken} 
        where user_id = ${user.user_id}`);
    }

/**
 * Gets the user with the given authToken from the database.
 * If there is no such user, undefined will be returned.
 * 
 * @param {string} authToken the user's authentication token
 */

async function retrieveUserWithAuthToken(authToken) {
    const db = await dbPromise;
    
    const user = await db.get(SQL`
        select * from users
        where authToken = ${authToken}`);

        return user;
}

// Export functions.
module.exports = {
    createUser,
    retrieveAllUsers,
    retrieveUserWithAuthToken,
    retrieveUserWithUsername,
    retrieveUserWithEmail,
    updateUser
    //retrieveUserById,
    //retrieveUserWithCredentials,
    
    
    //deleteUser
};

    // retrieveUserByUsername,