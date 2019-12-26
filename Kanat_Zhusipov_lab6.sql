CREATE DATABASE LAB6;
create table Employees
(
    EMPLOYEE_ID    serial,
    FIRST_NAME     varchar(50) NOT NULL,
    LAST_NAME      varchar(50) NOT NULL,
    EMAIL          varchar(100),
    PHONE_NUMBER   varchar(20),
    HIRE_DATE      date,
    JOB_ID         varchar(10),
    SALARY         int,
    COMMISSION_PCT float,
    MANAGER_ID     numeric,
    DEPARTMENT_ID  int,
    primary key (employee_id)
);

drop table Employees cascade;
CREATE TABLE Departments(
    department_id serial NOT NULL primary key ,
    department_name varchar(20),
    email varchar(40) unique default 'default@gmail.com',
    phone_number varchar(12),
    min_salary int,
    max_salary int
);

ALTER TABLE Employees
ADD CONSTRAINT email_constr check ( email like '%@%.%');

ALTER TABLE Departments
ADD CONSTRAINT email_constr check (min_salary<max_salary);

ALTER TABLE Departments
ADD CONSTRAINT email_constr2 check ( email like '%@%.%');

ALTER TABLE Departments
ADD CONSTRAINT const_ph_no check ( phone_number like '+7%');

ALTER TABLE Employees
ADD FOREIGN KEY(department_id) references Departments(department_id);

INSERT INTO Departments VALUES
        (default, 'Data Science',  'ds@mail.ru', '87777777777',  70000, 60000);
/* default should be without quotes, department_id are not same variable type*/
    /*we have constraint key that says our phone starts on only +7 digits */

alter TABLE Employees
add column bonus int;

alter table Employees
add constraint bonus_10percent_constr check ( bonus > salary/10 );

SELECT conname, consrc FROM
pg_catalog.pg_constraint;

alter table Departments
drop constraint const_ph_no;
