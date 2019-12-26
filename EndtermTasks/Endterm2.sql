/*
 TASK 1
1)inner join returns set that contains row in the left table that match with the row in the right table
Example
Select movieexecutive.name from movieexecutive inner join studio on movieexecutive.license = studio.presidentlicense
2)The left join returns set of rows from the left table with the matching rows if available from the right table. If there is no match, the right side will have null values.
Example
Select movieexecutive.name from movieexecutive left join studio on movieexecutive.license = studio.presidentlicense
3)The right join or right outer join is a reversed version of the left join.
example
Select movieexecutive.name from movieexecutive right join studio on movieexecutive.license = studio.presidentlicense
4) full outer join produces a result set that contains all rows from both the left and right tables, with the matching rows from both sides where available. If there is no match, the missing side contains null values.
Example
Select movieexecutive.name from movieexecutive full outer join studio on movieexecutive.license = studio.presidentlicense
5)A self-join is a query in which a table is joined to itself
Example
 select h1.name, h2.name from Highschooler h1 join Friend f1 on h1.ID=f1.ID1 join Highschooler h2 on h2.ID=f1.ID2 where h1.name='Gabriel' or h2.name='Gabriel';

 Task 2 separate file in png format

TASK 3.
1) In parameter is parameter which we can use in function but can't get them back as part of result
2) Out parameter is parameter which defined as part of function arguments and we can get them back as part of result
3) INOUT parameter is parameter which we can throw in function and get them as result (combination of in and out)
4) Variadic parameter is array parameter which function accept and all arguments of this parameter have to be same data type

TASK 4.
a)create view birthdays as select distinct birthdate from MovieStar(not updatable - the view requires SELECT DISTINCT)
b) create view StudioPres as select license, name, address from movieexecutive where license in(select presidentlicense from studio) (we can update because no rules are violated)
c)create view genderbalance as select count(*) from moviestar group by gender(can't update because of "group by")
d)Create view StudioPresInfo as select studio.name, movieexecutive.name, license from movieexecutive join studio where license = presidentlicense (not updatable, view requires more than more one table in its top-level FROM clause.)

 5 TASK
 select h1.name, h2.name from Highschooler h1 join Friend f1 on h1.ID=f1.ID1 join Highschooler h2 on h2.ID=f1.ID2 where h1.name='Gabriel' or h2.name='Gabriel';

 TASK 6.
 select h1.name, h1.grade,h2.name,h2.grade from Highschooler h1 join Likes l on h1.ID=l.ID1 join Highschooler h2 on h2.ID=l.ID2 where (h1.grade-h2.grade)>=2;


 7.TASK
 Select name, grade
FROM Highschooler
Join Likes l on highschooler.id = l.id2
Where (Select (count(id2) from likes group by id2) < 3;

 9 TASK
 SELECT H1.name, H1.grade, H2.name, H2.grade

FROM Highschooler H1, Highschooler H2, Likes L1, Likes L2

WHERE (H1.ID = L1.ID1 AND H2.ID = L1.ID2) AND (H2.ID = L2.ID1 AND H1.ID = L2.ID2) AND H1.name < H2.name

ORDER BY H1.name, H2.name;
 */