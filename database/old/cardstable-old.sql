CREATE TABLE cards (
  card_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(64),
  description VARCHAR (10000),
  tag_id INTEGER,
  course_name VARCHAR (64),
  module_id INTEGER,
  createdby_username VARCHAR(64),
  createdby_id INTEGER NOT NULL,
  status varchar(24),
  link_name varchar(1000),
  full_URL varchar(1000),
  foreign key (createdby_username) REFERENCES users(username),
  foreign key (createdby_id) REFERENCES users(id)
)