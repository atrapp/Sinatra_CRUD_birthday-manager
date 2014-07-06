-- The birthday manager database consists of 3 tables: people, countries and groups
-- with a 1 to many relationship between countries and people and
-- with a 1 to many relationship between groups and people;
-- the relation of a person to country and group shall help to find the ideal gift
-- based on origin, national specialties and the importance of that person towards yourself


CREATE DATABASE birthday_manager_db;

\c birthday_manager_db

CREATE TABLE people
(
  id serial4 PRIMARY KEY,
  name varchar(255),
  gender varchar(1),
  date_of_birth varchar(10),  
  image_url varchar(255),
  country_id integer,
  group_id integer
);

CREATE TABLE countries
(
  id serial4 PRIMARY KEY,
  name varchar(255),
  countrycode varchar(2),  
  description varchar(1000),
  image_url varchar(255)
);

CREATE TABLE groups
(
  id serial4 PRIMARY KEY,
  name varchar(255)
);