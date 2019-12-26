

CREATE TABLE accounts(
    id serial primary key ,
    name varchar(20) not null ,
    age int,
    balance int not null
);

BEGIN;
UPDATE accounts set balance = balance + 1000
where id=1;
UPDATE accounts set balance = balance - 20000
where id=2;
UPDATE accounts set balance = balance - 3000
where id=3;
ROLLBACK;


BEGIN;
UPDATE accounts set balance = balance - 1500
where name='Kirill';
UPDATE accounts set balance = balance + 1500
where name='Anna';
UPDATE accounts set balance = balance + 1500
where name='Adam';
ROLLBACK;
--4
BEGIN;
savepoint sv1;
DELETE FROM accounts WHERE name='Dana';
ROLLBACK TO sv1;
UPDATE accounts set balance = 70000
where name='Dana';
COMMIT;

--5
BEGIN;
UPDATE accounts set balance = balance - 3000
where id=3;
savepoint sv;
UPDATE accounts set balance = balance + 1000
where id=1 or id=2;
rollback to sv;
COMMIT;

--6.1
-- User_2 will see 32320
-- User_1 will see 32320
--6.2
--32320
--6.3
--32700

