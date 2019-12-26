CREATE DATABASE lab3;
CREATE TABLE Animals
(
    animal_id serial primary key,
    age       integer,
    name      varchar(50),
    type      char(15),
    weight    integer
);

INSERT INTO Animals VALUES(default,18,'pacan','mambets',50);



INSERT INTO Animals(age,name) VALUES(20,'Ivan');
INSERT INTO Animals(weight) VALUES(null);

INSERT INTO Animals (name, age) VALUES
  ('john doe', 22),
  ('jane do', 23),
  ('john d', 25),
  ('jane ', 24),
  ('john', 26);

ALTER TABLE Animals
ALTER COLUMN name SET DEFAULT 'Lion';

INSERT INTO Animals (name) VALUES (DEFAULT);
INSERT INTO Animals  VALUES (DEFAULT);

CREATE TABLE Animals_new (
    LIKE Animals including all
);
 SELECT  * from Animals_new
 WHERE NAME IS NOT NULL
order by age DESC
LIMIT 5;

alter table Animals_new
add column timestamp without time;

SELECT from Animals COALESCE (age);
INSERT INTO Animals_new SELECT * FROM Animals;

UPDATE Animals
SET TYPE =0
WHERE type IS NULL;

UPDATE Animals
SET weight = weight*1.5
RETURNING name, type, age, weight as New_weight;

DELETE FROM Animals
WHERE weight<100
 OR weight is null;
DROP TABLE Animals;

DELETE FROM Animals_new
WHERE animal_id in(select animal_id from Animals)
RETURNING *;

DELETE FROM Animals
RETURNING *;

DROP DATABASE lab3;
DROP TABLE Animals RESTRICT ;
DROP TABLE Animals_new CASCADE;
