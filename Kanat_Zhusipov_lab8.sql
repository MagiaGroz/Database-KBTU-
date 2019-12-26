CREATE DATABASE lab8;

CREATE TABLE actor(
    actor_id serial primary key ,
    first_name varchar(30),
    last_name varchar(30),
    age int,
    last_update date
);

insert into actor (first_name, last_name, age, last_update) VALUES
    ('John','Snow',26,'21-10-2010'),
    ('Emilia','Clark',31,'22-10-2010'),
    ('Scarlet','Johansson',34,'23-10-2010'),
    ('Tom','Cruze',43,'24-10-2010'),
    ('George','Need',29,'25-10-2010'),
    ('Kin','Shas',27,'26-10-2010'),
    ('Brad','Pitt',33,'27-10-2010'),
    ('Jimm','Kerry',53,'28-10-2010'),
    ('Robert','Downey Jr',45,'29-10-2010'),
    ('Anjelina','Jolie',44,'30-10-2010');
CREATE TABLE film_actor(
    actor_id int,
    film_name varchar(30),
      last_update date
);
CREATE INDEX actor_first_name_index on actor((first_name='John'));
CREATE INDEX actor_first_name_idx on actor((first_name='John'));
CREATE INDEX actor_first_last_name_index on actor((first_name='RAY',last_name='JOHANSSON'));

create index cust_idx on customer((cust_name='string'));

create index cust_city_idx on customer((cust_name='string' and city = 'string'));
create unique index uniq_cust_idx on customer(city);
CREATE UNIQUE INDEX actor_last_update_index
    on actor((last_update between '01-01-2018' and '01-01-2019') );

CREATE INDEX actor_substring_first_name_index
    on actor((substring(first_name from 1 for 4)='NICK'));


create index actor_last_update_idx on
actor
    ((last_update > '30-09-2019'  AND last_update < '12-12-2016'));

select indexname from pg_indexes
where tablename like 'A%';

select count(indexdef), indexdef from pg_indexes
group by indexdef;

create table customer(
    customer_id  serial primary key,
    cust_name varchar(20),
  salesman_id int,
  city text,
  grade int
);
create table salesman(
    salesman_id serial primary key,
    name varchar(20),
    comission numeric,
    city text
);
Select  name,cust_name from salesman inner join customer using(salesman_id);
select cust_name from customer inner join salesman using(salesman_id) where
comission>0.12 and customer.city!=salesman.city;
select * from salesman left join customer using (salesman_id)
where grade<300 order by grade;
Select ord_no, ord_date, purch_amt, cust_name, name, comission from
orders join customer using(customer_id) join salesman using(salesman_id);