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
	"name"	INTEGER,
	PRIMARY KEY("id")
);
INSERT INTO "app_users" ("id","username","email","password","created_at","updated_at","deleted_at","name") VALUES (1,'t1','a@b.com','$2b$10$REb5BvKQbzpXQwuKCBcxhu5Dhz2TmbX2NbBZSVAA9uZPaNqrQ6nGe','2023-01-12 14:56:31',NULL,NULL,'t1');
COMMIT;