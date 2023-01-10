BEGIN TRANSACTION;
DROP TABLE IF EXISTS "app_users";
CREATE TABLE IF NOT EXISTS "app_users" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"password_hash"	TEXT NOT NULL,
	"created_at"	DATETIME NOT NULL,
	"updated_at"	DATETIME NOT NULL,
	"deleted_at"	DATETIME,
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "sessions";
CREATE TABLE IF NOT EXISTS "sessions" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"start_time"	DATETIME NOT NULL,
	"end_time"	DATETIME,
	FOREIGN KEY("user_id") REFERENCES "app_users"("id"),
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "auth_tokens";
CREATE TABLE IF NOT EXISTS "auth_tokens" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"token"	TEXT NOT NULL,
	"created_at"	DATETIME NOT NULL,
	"expires_at"	DATETIME NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "app_users"("id"),
	PRIMARY KEY("id")
);
INSERT INTO "app_users" ("id","name","email","password_hash","created_at","updated_at","deleted_at") VALUES (1,'John Smith','john@example.com','$2b$12$I1KGp/vYVYMZ8N2I/N2oKuPPrKc.39W8bq3O.G1fH9Xvtn8kKWz4y','2022-01-01 12:00:00','2022-01-01 12:00:00',NULL),
 (2,'Jane Doe','jane@example.com','$2b$12$I1KGp/vYVYMZ8N2I/N2oKuPPrKc.39W8bq3O.G1fH9Xvtn8kKWz4y','2022-01-01 12:00:00','2022-01-01 12:00:00','2022-01-02 12:00:00');
INSERT INTO "sessions" ("id","user_id","start_time","end_time") VALUES (1,1,'2022-01-01 12:00:00','2022-01-01 13:00:00'),
 (2,1,'2022-01-02 12:00:00','2022-01-02 13:00:00'),
 (3,2,'2022-01-03 12:00:00','2022-01-03 13:00:00');
INSERT INTO "auth_tokens" ("id","user_id","token","created_at","expires_at") VALUES (1,1,'abc123','2022-01-01 12:00:00','2022-01-01 13:00:00'),
 (2,1,'def456','2022-01-02 12:00:00','2022-01-02 13:00:00'),
 (3,2,'ghi789','2022-01-03 12:00:00','2022-01-03 13:00:00');
COMMIT;
