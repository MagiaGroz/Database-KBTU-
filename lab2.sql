CREATE DATABASE lab2;
CREATE TABLE Faculties(
    id SERIAL,
    name CHAR(100),
    number_of_students integer
);

ALTER TABLE Faculties
ADD COLUMN description text;
SELECT * FROM Faculties;
SELECT * FROM Students;
INSERT INTO Faculties VALUES(default,'kaka',30,'BEST GROUP');
ALTER TABLE Faculties
ALTER COLUMN name TYPE char(150);

ALTER TABLE Faculties
ADD CONSTRAINT primk primary key (id);

CREATE TABLE Students(
  id SERIAL,
  first_name char(50),
  last_name char(50),
  gender char(10),
  faculty_id int references Faculties(id),
  is_finished boolean
);

ALTER TABLE Students
ALTER COLUMN is_finished SET DEFAULT FALSE;

DROP TABLE Faculties RESTRICT;
DROP TABLE FACULTIES CASCADE;
DROP DATABASE lab2;