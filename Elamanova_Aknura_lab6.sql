CREATE DATABASE LAB6;
--1
create table Employees
(
    EMP_ID    serial,
    FIRST_NAME     varchar(20) NOT NULL,
    LAST_NAME      varchar(40) NOT NULL,
    BEGIN_DATE      date check ( BEGIN_DATE>'2001-01-01' ),     --2
    END_DATE        date check ( END_DATE>BEGIN_DATE ),
    JOB_TITLE       varchar(50) default '',
    SALARY         int not null ,
    primary key (emp_id)
);


CREATE TABLE Departments(
    department_id serial NOT NULL primary key ,
    emp_id int references Employees,
    department_name varchar(5),
    email varchar(40) unique default 'default@gmail.com',
    phone_number varchar(12),
    hire_date timestamp without time zone
);
--3
ALTER TABLE Employees
    ADD CONSTRAINT chk_salary check ( SALARY>65000 );
--4
alter table Employees
    add constraint uni_lastname unique (LAST_NAME);
--5
alter table Employees
    drop constraint chk_salary;
--6
select conname from pg_catalog.pg_constraint
    where conname like '%fkey';
--7
alter table Departments
    add constraint chk_departments check ( department_name='FIT' or 'BS' or 'FEOG' or 'FGGE');
--8
alter table Employees
    drop column EMP_ID cascade ;
--9
SELECT LAST_NAME FROM Employees
    WHERE EMP_ID>(SELECT EMP_ID FROM Employees WHERE LAST_NAME='Fleming')
order by LAST_NAME;
--10
alter table Employees
    drop constraint uni_lastname;
