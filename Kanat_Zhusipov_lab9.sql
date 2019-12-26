CREATE DATABASE LAB9;
--1
CREATE TABLE Employees(
    id serial primary key ,
    name varchar(30),
    age int,
    address varchar(30),
    salary int,
    department_id int
);
--2
CREATE VIEW Address_view as select name, address from Employees;
--3
ALTER VIEW Address_view rename to ad_view;
--4
CREATE VIEW david_view as select address from Employees
    where name='David';
--5
DROP VIEW ad_view;
--6
CREATE ROLE some_role LOGIN ;
--7
CREATE ROLE some_role2 LOGIN PASSWORD '123456' VALID UNTIL '2019-12-31';
--8
CREATE ROLE some_role3 createdb createrole;
--9
alter role some_role2 password 'dsa8tyu75';
ALTER ROLE some_role2 PASSWORD NULL;
--10
alter role some_role2 valid until
    '2020-05-01 12:00:00 +0100' ;
--11
alter role some_role2 valid until
    'infinity';
--12
ALTER ROLE some_role2 SET maintenance_work_mem = 70000;
--13
create materialized view sal_view as select
    * from Employees where salary>20000
with no data;
--14
CREATE VIEW emp_view as select id, name,
    salary from Employees
where department_id= 50;
--15
DROP VIEW emp_view cascade ;
--16
create materialized view emp_mview as
    select * from Employees
where ascii(name) between 65 and 72
and (salary = 10000 or salary = 20000 or salary= 15000)
with data;
