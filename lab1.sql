CREATE DATABASE lab1;

CREATE TABLE users(
id serial,
firstname char(50),
lastname char(50)
);
ALTER TABLE users
ADD COLUMN isadmin int;
ALTER TABLE users
    ALTER isadmin TYPE boolean USING isadmin::boolean;
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;
ALTER TABLE users
    ADD CONSTRAINT pk primary key (id);

CREATE TABLE tasks(
    id serial,
    name char(50),
    user_id integer
);

DROP TABLE tasks;
DROP DATABASE lab1;
