create database quiz2;

--1
select * from employees e1 join employees e2 on e1.chief_id = e2.id
where e1.department_id <> e2.departmentd_id;
--2
/* Join is union of two tables
   Inner join takes only common rows
   Left join is type of join where we get all from left table and also
    common rows from two tables
   Right join is visa verse of left join
   Full outer join get all rows from two tables (common and not common rows)
    Cross join returning all possible combinations of all rows.
   It has no on clause because you're just joining everything to everything.
 */
--3
/*
A view is called a virtual table.
When you are querying a view you
feel like you are querying a table but it not,
what you view is a result of a query that is saved under the view.
*/
CREATE VIEW view1 as select * from employees;
CREATE MATERIALIZED VIEW view2 as select * from employees;
--4
/*
 View can be materialized with data or without data at creating
but if you want run materialized view you have to load data
 Yes view can based on another view
 */
--5
/*
PostgreSQL provides several index types:
B-tree, Hash, GiST, GIN
B-trees can handle equality and range queries on data that
can be sorted into some ordering.
B tree is useful at these operators:
< ; <= ; = ; >= ; > ;

Hash indexes can only handle simple equality comparisons.

Gist is useful at these operators
<< &< &> >> <<| &<| |&> |>> @> <@ ~= &&

GIN indexes are inverted indexes which can handle values
that contain more than one key, arrays for example.
GIN operator classes for one-dimensional arrays,
which support indexed queries using these operators
<@ @> = &&
*/

--6
create table dbo.envelope (
    is int,
    user_id int
);
create table dbo.docs(
    idnum int,
    pageseq int,
    doctext varchar(100)
);
insert into dbo.envelope values (1,1),(2,2),(3,3);
insert into dbo.docs values(idnum,pageseq) (1,5),(2,6),(null,0);

UPDATE docs
SET doctext=pageseq
FROM docs INNER JOIN envelope ON envelope.id=docs.idnum
WHERE EXISTS (
  SELECT 1 FROM dbo.docs
  WHERE id=envelope.id
);
/*
if idnum exist in envelope table then UPDATE
command will update doctext (Set doctext=pageseq) column from docs table
 */
 --7
create table product(
    id int,
    name name,
    price int,
    date date
);
 create table purchase(
     id serial primary key ,
     name name,
     user_id int references  user,
     product_id int references  product
 );
create table user(
    id serial primary key ,
    name name
);

SELECT * FROM USER JOIN purchase ON "user".id = purchase.user_id;
select "user".name, sum(price) from user join purchase p on "user".id = p.user_id
    join product on p.id = product.id group by "user".id;
select * from purchase join product on purchase.product_id = product.id
where date 'April 2019';
select count(*) from purchase join product
    on purchase.product_id = product.id
group by date;


--Quiz 11.11.2019
create table Admissions (
    studentid int references student,
    AdmissionYear int,
    branch varchar(20)
);
create table student(
    studentid int primary key ,
    name varchar(20),
    address varchar(20)
);

SELECT Admissions.StudentID, Student."name",
       Admissions.AdmissionYear FROM Admissions
    RIGHT JOIN student ON Admissions.StudentID=student.StudentID;
-- in output will be all students from student table
-- and students with common id from admissions

--2
--UPDATE view1 SET comment='joe' WHERE hostname='joesplace.com';
--3
/*
 PostgreSQL provides several index types:
B-tree, Hash, GiST, GIN
B-trees can handle equality and range queries on data that
can be sorted into some ordering.
B tree is useful at these operators:
< ; <= ; = ; >= ; > ;

Hash indexes can only handle simple equality comparisons.

Gist is useful at these operators
<< &< &> >> <<| &<| |&> |>> @> <@ ~= &&

GIN indexes are inverted indexes which can handle values
that contain more than one key, arrays for example.
GIN operator classes for one-dimensional arrays,
which support indexed queries using these operators
<@ @> = &&
 */
--4
/*
 You can only have one primary key for a table
 so would just need to pick one if you have multiple candidates.
 */
--5
/*
 They are virtual so they don't place in memory
 also view can get many columns from many tables
 */
--6
create table Employee(
    Emp_id serial primary key ,
    Last_name varchar(20),
    First_name varchar(20),
    Job_Role varchar(20)
);
create table Joining(
    Emp_id int references Employee,
    Last_name varchar(20),
    First_name varchar(20),
    Joining_Date date
);
/*
 In result we will have all employees
 and after them employees with common id in numerical order
 */
 create table river(
     id serial primary key ,
     name varchar(20),
     trid_id int references tributaries
 );
create table tributaries(
    id serial primary key ,
    name varchar(20),
    sea_id int references sea,
    river_id int references river
);
create table sea(
    id serial primary key ,
    name varchar(20)
);
--7
select river.name from river join tributaries t on river.id = t.river_id
join sea s on t.sea_id = s.id where s.name = 'Black sea';

select r.name, t.name from tributaries t join river r on t.id = r.trid_id
join sea s on t.sea_id = s.id where s.name='Black sea';

select t.name from tributaries t join river r on t.id = r.trid_id
where r.name='Dnieper river';

select r.name , s.name from river r join tributaries t on r.id = t.river_id
join sea s on t.sea_id = s.id where t.name='Dnieper river';
