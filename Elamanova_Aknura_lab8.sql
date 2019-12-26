CREATE DATABASE LABB8;
CREATE TABLE Employees (
  emd_id serial primary key,
  emp_name char(50),
  job_name char(50),
  manager_id int,
  hire_date date,
  salary numeric,
  comission numeric,
  dep_id int
);
--3
CREATE INDEX name_idx on Employees((emp_name='string'));
--4
CREATE INDEX empname_jobname_idx on Employees((emp_name='string' and job_name='string'));
--5
CREATE INDEX salary_idx on Employees((salary<1000 and salary>500));
--6
CREATE INDEX commision_idx on Employees(comission asc nulls first);
CREATE INDEX dep_id_idx on Employees(dep_id desc nulls last);
--7
CREATE UNIQUE INDEX empname_idx on Employees(emp_name);
--8
CREATE INDEX man_com_job_idx on Employees(manager_id,comission,job_name);
--9
CREATE INDEX empname_jobname_idx on Employees(lower(job_name));
--10
DROP INDEX man_com_job_idx;