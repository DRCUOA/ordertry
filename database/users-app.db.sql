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
DROP TABLE IF EXISTS "cards";
CREATE TABLE IF NOT EXISTS "cards" (
	"id"	INTEGER,
	"card_title"	TEXT NOT NULL,
	"card_content"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "tags";
CREATE TABLE IF NOT EXISTS "tags" (
	"id"	INTEGER,
	"tag_name"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "card_tags";
CREATE TABLE IF NOT EXISTS "card_tags" (
	"card_id"	INTEGER,
	"tag_id"	INTEGER,
	FOREIGN KEY("card_id") REFERENCES "cards"("id"),
	FOREIGN KEY("tag_id") REFERENCES "tags"("id")
);
INSERT INTO "app_users" ("id","username","email","password","created_at","updated_at","deleted_at","name","authToken") VALUES (1,'bob','bob@somewhere.com','$2b$10$kOl8iyhoX/gt7FtP.jF.d.OKo5p5tPgmipIpzHI11bJMpu89t29F2','2023-01-23 17:07:43',NULL,NULL,'Richard',NULL),
 (2,'dev','rdcpem@gmail.com','$2b$10$Bv2ptZvvis1blEuXK..14OggWetAC65ieGZcNggYENHCVwAjRfWC2','2023-01-23 17:13:49','2023-01-27 08:28:34',NULL,'asdf','9626ec03-fb53-412a-9b12-2e042ba69ed9');
INSERT INTO "cards" ("id","card_title","card_content") VALUES (1,'Javascript','Javascript is a programming language used for creating interactive websites and web applications. It can be used to add dynamic behavior to HTML and CSS.'),
 (2,'Approach to write a Novel','<ol>
          <li>
            <strong>Conceptualization: </strong>This is the initial stage where I come up with the idea for the story and develop the main characters, setting, and plot. I also think about the themes and messages that I want the story to convey.
          </li>
          <li>
            <strong>Outlining: </strong>Once I have a solid concept, I create an outline for the story. This includes mapping out the plot, including major events and turning points, as well as character development and subplots.
          </li>
            <strong>Drafting: </strong>With the outline in place, I begin writing the first draft. I focus on getting all of the ideas down on paper and worry less about making it perfect at this stage.
          <li>
            <strong>Revising: </strong>After I have a complete first draft, I go through and revise it. This is where I focus on making the story as polished and compelling as possible. I pay attention to pacing, character development, dialogue, and other elements.
          </li>
          <li>
            <strong>Editing: </strong>After I&#39;ve made all of the revisions I think are necessary, I work with an editor who will give me feedback and help me make the story even better.
          </li> 
          <li>
            <strong>Finalizing: </strong>Once the editing is done, I will make any final changes and prepare the manuscript for publication.
          </li>
        </ol>
          <p>
Throughout the process, I also make sure to take breaks and step away from the manuscript to gain new perspectives and fresh ideas.

          </p>');
INSERT INTO "tags" ("id","tag_name") VALUES (1,'Web Development'),
 (2,'Programming'),
 (3,'Front-end Development'),
 (4,'ECMAScript'),
 (5,'JavaScript frameworks'),
 (6,'Writing'),
 (7,'Planning');
INSERT INTO "card_tags" ("card_id","tag_id") VALUES (1,1),
 (1,2),
 (1,3),
 (1,4),
 (1,5),
 (2,6),
 (2,7);
COMMIT;
