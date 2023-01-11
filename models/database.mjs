import { open } from 'sqlite';
import sqlite3 from 'sqlite3';

export const dbPromise = open({
      filename: "./users-app.db",
      driver: sqlite3.Database
});

