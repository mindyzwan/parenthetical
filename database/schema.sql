CREATE TABLE users (
  id serial PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email varchar(255) UNIQUE NOT NULL,
);

CREATE TABLE scripts (
  id serial PRIMARY KEY,
  script_name varchar(255) NOT NULL,
  content text,
  user_id int NOT NULL
);

ALTER TABLE scripts ADD FOREIGN KEY (user_id) REFERENCES users (id);