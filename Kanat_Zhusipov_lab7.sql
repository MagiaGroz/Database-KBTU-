CREATE DATABASE lab7;

CREATE TABLE customer(
    customer_id integer,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

INSERT INTO customer VALUES (1, 'MARY', 'SMITH', 'MARY.SMITH@sakilacustomer.org');
INSERT INTO customer VALUES (2, 'PATRICIA', 'JOHNSON', 'PATRICIA.JOHNSON@sakilacustomer.org');
INSERT INTO customer VALUES (3, 'LINDA', 'WILLIAMS', 'LINDA.WILLIAMS@sakilacustomer.org');
INSERT INTO customer VALUES (12, NULL, NULL, NULL);
INSERT INTO customer VALUES (4, 'BARBARA', 'JONES', 'BARBARA.JONES@sakilacustomer.org');
INSERT INTO customer VALUES (5, 'ELIZABETH', 'BROWN', 'ELIZABETH.BROWN@sakilacustomer.org');
INSERT INTO customer VALUES (6, 'JENNIFER', 'DAVIS', 'JENNIFER.DAVIS@sakilacustomer.org');
INSERT INTO customer VALUES (7, 'MARIA', 'MILLER', 'MARIA.MILLER@sakilacustomer.org');
INSERT INTO customer VALUES (12, 'MARIA', 'MAISON', 'MARIA.MAISON@sakilacustomer.org');
INSERT INTO customer VALUES (8, 'SUSAN', 'WILSON', 'SUSAN.WILSON@sakilacustomer.org');
INSERT INTO customer VALUES (9, 'MARGARET', 'MOORE', 'MARGARET.MOORE@sakilacustomer.org');
INSERT INTO customer VALUES (13, NULL, NULL, NULL);
INSERT INTO customer VALUES (10, 'DOROTHY', 'TAYLOR', 'DOROTHY.TAYLOR@sakilacustomer.org');
INSERT INTO customer VALUES (11, 'LISA', 'ANDERSON', 'LISA.ANDERSON@sakilacustomer.org');
INSERT INTO customer VALUES (4, 'BARBI', 'JONES', 'B.JONES@sakilacustomer.org');

CREATE TABLE payment (
    payment_id integer,
    customer_id int,
    rental int,
    commission float ,
    payment_date DATE
);

INSERT INTO payment VALUES (1, 1, 7, 1.99, '2019-01-24 21:40:19');
INSERT INTO payment VALUES (5, 12, 98, 0.99, '2019-01-25 15:16:50');
INSERT INTO payment VALUES (2, 3, 678, 6.99, '2019-01-28 21:44:14');
INSERT INTO payment VALUES (1, 11, 703, 0.99, '2019-02-15 09:57:20');
INSERT INTO payment VALUES (4, 4, 750, 4.99, '2019-01-29 08:10:06');
INSERT INTO payment VALUES (5, 2, 1099, 2.99, '2019-01-31 12:23:14');
INSERT INTO payment VALUES (6, 6, 193, 1.99, '2019-01-26 05:10:14');
INSERT INTO payment VALUES (7, 13, 1040, 4.99, '2019-01-31 04:03:42');
INSERT INTO payment VALUES (8, 8, 1096, 8.99, '2019-01-31 11:59:15');
INSERT INTO payment VALUES (9, 9, 33, 0.99, '2019-01-25 02:47:17');
INSERT INTO payment VALUES (10, 10, 405, 6.99, '2019-01-27 12:01:05');
INSERT INTO payment VALUES (1, 10, 1041, 6.99, '2019-10-01 09:57:20');

CREATE TABLE rental (
    rental_id integer,
    rental_date DATE,
    customer_id integer ,
    payment_id integer ,
    last_update DATE
);

INSERT INTO rental VALUES (2, '2005-05-24 22:54:33', 9, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (3, '2005-05-24 23:03:39', 8, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (4, '2005-05-24 23:04:41', 3, 2, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (5, '2005-05-24 23:05:21', 2, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (6, '2005-05-24 23:08:07', 9, 6, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (7, NULL, 9, 7, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (8, '2005-05-24 23:31:46', 9, 9, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (9, '2005-05-25 00:00:40', 6, 10, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (10, '2005-05-25 00:02:21', 3,10, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (11, '2005-05-25 00:09:02', 2, 3, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (12, NULL, 3, 4, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (13, '2005-05-25 00:22:55', 4, 5, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (14, '2005-05-25 00:31:15', 6, 3, '2017-02-16 02:30:53');


select first_name, last_name, rental from customer
INNER JOIN payment p on customer.customer_id = p.customer_id;

select first_name, rental from customer
inner join payment p on customer.customer_id = p.customer_id
where commission=0.99 or commission=1.99 or commission=2.99;

select * from customer
    left join payment on customer.customer_id = payment.customer_id
    left join rental on customer.customer_id = rental.customer_id
where rental.rental_date is not null
and payment.commission is not null;

select * from customer inner join payment using (customer_id)
where rental>2;

select customer_id, rental*commission as final_rent
from customer inner join payment using(customer_id);

select first_name, last_name from customer inner join rental using(customer_id)
where rental_date='2005-05-24';

select * from customer
left outer join rental using (customer_id)
where rental_id is null;

select payment_date from payment;
select first_name, last_name, customer_id,
       lag(rental) over ( partition by customer_id order by rental_date) prev_rental,
       rental as current_rental from customer inner join payment using(customer_id) join rental;

select count(customer_id),
       (select sum(rental*commission) group by payment_date) as final_rent
from customer inner join payment using(customer_id)
group by payment_date;

update customer
set email = replace(email,'sakilacustomer.org','kbtustudent.kz')
where customer_id in(
    select customer_id from customer
    left outer join rental using(customer_id)
    where rental_date is null
                    )
returning *;