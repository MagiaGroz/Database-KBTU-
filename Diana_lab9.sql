create database lab9;
create table employees(
    id serial primary key ,
    name varchar(50),
    age int,
    address varchar(50),
    salary int,
    department_id int
);

insert into employees(name,age) values('sgrg',243);
--2
CREATE VIEW Address_view as select name, address from employees;

--3
alter view Address_view rename to add_view;
--4
create view david_view as select address from Address_view
    where address='David';
--5
Drop view Address_view;
--6
create role user1 login ;
--7
create role user2 password 'lol' valid until '31-12-2019';
--8
create role user3 createdb createrole ;
--9
alter role user2 password  'dsa8tyu75';
ALTER ROLE user2 PASSWORD NULL;
--10
alter role user2 valid until '12:00:00 01-05-2020 +0100';
--11
alter role user2 valid until 'infinity';
--12
ALTER ROLE user2 SET maintenance_work_mem = 70000;
--13
CREATE MATERIALIZED VIEW SAL_VIEW
    AS SELECT * FROM employees
    WHERE salary>20000
    WITH NO DATA ;
--14
CREATE VIEW emp_view as select id, name, salary from employees
where department_id=50;
--15
drop view emp_view cascade ;
--16
create materialized view emp_mview as select * from employees
where ascii(name) between 65 and 72
    and (salary =10000 or salary = 20000 or salary=15000);

