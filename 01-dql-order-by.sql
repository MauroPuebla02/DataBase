#1
SELECT * FROM movies;
#2
SELECT first_name, last_name, rating FROM actors;
#3
SELECT title from series;
#4
SELECT title, rating, length FROM movies;
#5
SELECT first_name, last_name FROM actors WHERE rating > 7.5;
#6
SELECT title, rating , awards FROM movies WHERE
rating > 7.5 AND awards > 2;
#7
SELECT title,rating FROM movies ORDER BY rating;
#8
SELECT * FROM actors WHERE rating BETWEEN 4 and 10 ;
#9
SELECT title, release_date FROM movies WHERE length >150;
#10
SELECT title, rating FROM movies WHERE title LIKE "%Toy Story%";
#11
SELECT * FROM actors WHERE first_name LIKE "Sam%";
#12
SELECT first_name, last_name FROM actors ORDER BY rating DESC;
#13
SELECT title,release_date FROM movies ORDER BY rating DESC;
#14
SELECT first_name, last_name FROM actors WHERE first_name LIKE "%a%";
#15
SELECT title FROM movies WHERE release_date BETWEEN "2004-01-01" AND "2008-12-31";