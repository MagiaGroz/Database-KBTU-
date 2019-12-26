CREATE DATABASE MIDVAR2;
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


SELECT DISTINCT size FROM Movies;

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