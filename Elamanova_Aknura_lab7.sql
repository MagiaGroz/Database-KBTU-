CREATE TABLE LABB7;
--TABLE
CREATE TABLE locations(
    location_id serial primary key ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
CREATE TABLE departments(
        department_id serial primary key ,
        department_name varchar(50) unique,
        budget int,
        location_id int references locations
);
CREATE TABLE employees (
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    manager_id int references managers,
    department_id int references departments
);

CREATE TABLE job_grades (
    grade char(1),
    lowest_salary integer,
    highest_salary int
);

CREATE TABLE managers(
    manager_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50)
);
--3
select first_name,department_id,city,state_province from employees join departments using(department_id)
    join locations using(location_id) where last_name='%b%';
--4
select department_name,city,state_province from departments join locations l using(location_id);
--5
select first_name, managers.first_name from employees left join managers using(manager_id);
--6
select grade, avg(salary) from employees,job_grades;
select grade, lowest_salary+highest_salary/2 as avg from job_grades;
--7
select first_name, last_name from employees join departments using (department_id)
    join locations using(location_id) where city='London';
--8
select first_name, last_name, department_id, department_name
from employees join departments using(department_id);
--9
select first_name, last_name, department_id, department_name
from employees join departments using(department_id) where budget =80 or budget = 40;
--10
select first_name, last_name , department_id from employees join departments using(department_id)
where department_id in (select department_id from departments join employees using(department_id)
    where last_name = 'Taylor');

