BEGIN TRANSACTION;
DROP TABLE IF EXISTS "app_users";
CREATE TABLE IF NOT EXISTS "app_users" (
	"id"	INTEGER,
	"username"	TEXT NOT NULL,
	"email"	TEXT,
	"password"	TEXT NOT NULL,
	"created_at"	DATETIME,
	"updated_at"	DATETIME,
	"deleted_at"	DATETIME,
	"name"	TEXT,
	"authToken"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "app_users" ("id","username","email","password","created_at","updated_at","deleted_at","name","authToken") VALUES (16,'usertest','someone@somewhere.com','$2b$10$dqGPFiIImtEMcayr1hOpoe3P4IHUqMB4wLBPftcZFmdJHxdFTGo1e','2023-01-19 00:15:31','2023-01-20 23:41:08',NULL,'Richard','dded38e2-b774-4cbc-a1fe-ab2d7e970c8a');
COMMIT;
