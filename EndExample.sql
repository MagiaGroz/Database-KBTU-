

select h1.name , h2.name from Highschooler h1 join Friend on id = id1 join Highschooler h2 join Friend on id = id2
where h1.name= 'Gabriel' or h2.name ='Gabriel'
Select h1.name, h1.grade, h2.name , h2.grade from Highschooler h1 join likes j1 on id=id1 join
    Highschooler h2 on id=id2 where h1.grade-h2.grade>2 or h1.grade-h2.grade=2;

select name, grade from Highschooler
where id in (select id2 from Likes
             group by id2
            having count(*)>1);

select h1.name , h2.name from Highschooler h1 join Friend on id = id1 join Highschooler h2 on id = id2
where h1.grade=h2.grade
order by grade, name;

select h1.name, h1.grad0e , h2.name, h2.grade from Highschooler h1, Highschooler h2, Likes l1 , Likes l2
where (h1.id=l1.id1 and h2.id=l1.id2) and (h2.id = l2.id1 and h1.id=l2.id2)
and h1.name<h2.name
order by name;

CREATE ROLE KBTU CONNECTION LIMIT 1 LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD 'SRGDSRG' VALID UNTIL '2019-12-31';
ALTER ROLE KBTU VALID UNTIL '2020';
DROP ROLE KBTU;
CREATE INDEX KIMEP ON STUDENTS((NAME AND AGE>18));
DROP INDEX KIMEP;
CREATE MATERIALIZED VIEW KRMU AS SELECT NAME FROM STUDENTS WITH NO DATA;
SELECT NAME FROM KRMU;
REFRESH MATERIALIZED VIEW KRMU;

CREATE VIEW SDU AS SELECT NAME,ORDER,DATE,AGE FROM DB;
CREATE VIEW NU AS SELECT NAME,ORDER,DATE FROM SDU WHERE NAME='GABRIEL';
CREATE VIEW ABAYA AS SELECT NAME, ORDER FROM NU;

