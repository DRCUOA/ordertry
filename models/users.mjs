import sqlite3 from 'sqlite3';
import bcrypt from 'bcrypt';
import { devModels } from '../app.mjs'

const saltRounds = 10;

let db = new sqlite3.Database('./users-app.db', sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        devModels(err.message);
    }
    devModels(`Connected to the database.`);
});

export const createUser = (username, password) => {
    return new Promise((resolve, reject) => {
        bcrypt.hash(password, saltRounds, function(err, hash) {
            if (err) {
                reject(err);
            }
            let sql = `INSERT INTO app_users (username, password) VALUES (?, ?)`;
            let values = [username, hash];
            db.run(sql, values, function(err) {
                if (err) {
                    reject(err);
                }
                resolve({username, hash});
                db.close();
            });
        });
    });
}

export const getUser = (username) => {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * FROM users WHERE username = ?`;
        let values = [username];
        db.get(sql, values, (err, row) => {
            if (err) {
                reject(err);
            }
            resolve(row);
        });
    });
}
