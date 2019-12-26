CREATE DATABASE MIDEXAMPLE;

CREATE TABLE Movies(
    id serial primary key ,
    title varchar(255) not null unique ,
    rating integer,
    genre varchar(50) not null
);

CREATE TABLE Theaters(
    id serial primary key ,
    name varchar(255) not null unique ,
    size integer not null,
    city varchar(50) not null
);
INSERT into Theaters(name, size, city) values('Kinopark Esentai',15,'Almaty'),
                                              ('Star Cinema Mega',7,'Almaty'),
                                              ('Kinopark 8',9,'Shymkent'),
                                              ('Star Cinema 15',11,'Astana');

INSERT INTO Movies(title, rating, genre) values('Citizen Kane',5,'Drama'),
                                            ('Singin in the Rain',7,'Comedy'),
                                            ('The wizard Oz',7,'Fantasy'),
                                            ('The quiet man',null,'Comedy'),
                                            ('North by Northwest',null,'Thriller'),
                                            ('The last tango in Paris',9,'Drama');


SELECT DISTINCT rating FROM Movies;

SELECT* FROM Movies
where rating is not null
ORDER BY rating DESC
LIMIT 3;

SELECT * FROM Theaters
ORDER BY size DESC
OFFSET 2
LIMIT 1;

SELECT * FROM Movies
WHERE rating IS NULL;

SELECT * FROM Theaters
WHERE size>7 and city = 'Almaty' or size>7 and city = 'Shymkent';

SELECT id as MovieId, ('The genre of '||title||' is '||genre)as MovieInfo from Movies
limit 3;

CREATE TABLE movietheaters(
    theater_id integer references Theaters(id),
    movie_id integer references Movies(id),
    rating integer,
    primary key(theater_id,movie_id)
);

INSERT INTO movietheaters values(1,5,5),
                                 (3,1,7),
                                 (1,3,9),
                                 (4,6,6);

SELECT title FROM Movies
WHERE id NOT IN(SELECT movie_id FROM movietheaters);

SELECT title, CASE WHEN rating is null then format('No rating')
            WHEN rating between 0 and 3 then format('Low Rating')
            WHEN rating between 4 and 7 then format('Medium Rating')
            WHEN rating between 8 and 10 then format('High Rating')
END
    from Movies;

UPDATE Movies
SET rating = 1
where rating is null;

delete from Movies
where id not in(select movie_id from movietheaters);

SELECT * FROM Movies
WHERE title LIKE 'T_e%n' 'S%o_';

select avg(rating),genre from Movies
group by genre;

select name from Theaters
where  id in(select theater_id from movietheaters
        GROUP BY theater_id
    having count(theater_id)>1) ;

/* 2ND VARIANT OF MIDTERM */
SELECT UPPER(title),(substring(title from 4 for char_length(title))),CHAR_LENGTH(title) FROM Movies;

SELECT AVG(size) FROM Theaters
GROUP BY city;
insert into movietheaters values (2,1,8),
                                 (4,1,9);
SELECT title FROM Movies
WHERE id in(select movie_id from movietheaters
    group by movie_id
    having count(movie_id)>2);

SELECT DISTINCT on(genre) genre ,title from Movies;