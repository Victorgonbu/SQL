SELECT id, title
FROM movie
WHERE yr=1962;

SELECT yr FROM movie WHERE title = 'Citizen Kane';

SELECT  id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;

SELECT id FROM actor WHERE name = 'Glenn Close';

SELECT id FROM movie WHERE title = 'Casablanca';

SELECT actor.name FROM casting JOIN actor ON (actor.id = casting.actorid) 
WHERE movieid = '11768';

SELECT actor.name FROM casting JOIN actor ON actor.id = casting.actorid JOIN movie ON movie.id = casting.movieid 
WHERE title = 'Alien'

SELECT title FROM movie 
JOIN casting ON casting.movieid = movie.id 
JOIN actor ON actor.id = casting.actorid 
WHERE name LIKE 'Harrison Ford';

SELECT title FROM movie 
INNER JOIN casting ON movie.id =casting.movieid 
INNER JOIN actor ON casting.actorid=actor.id 
WHERE name LIKE 'Harrison Ford' AND casting.ord<>1;

SELECT title,actor.name FROM movie 
INNER JOIN casting ON movie.id=casting.movieid
INNER JOIN actor ON actor.id=casting.actorid
WHERE yr='1962' AND ord=1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title, name FROM movie JOIN casting ON (movieid=movie.id AND 
                                               ord = 1)
                              JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (SELECT movieid FROM casting
                    WHERE actorid IN (
                    SELECT id FROM actor
                     WHERE name='Julie Andrews'))

SELECT name FROM actor 
JOIN casting ON casting.actorid = actor.id 
WHERE ord = '1' GROUP BY actor.name HAVING COUNT(*) > 14 ORDER BY name;

SELECT title, COUNT(*) AS co FROM casting 
JOIN actor ON casting.actorid = actor.id 
JOIN movie ON movie.id = casting.movieid WHERE yr = '1978' GROUP BY title ORDER BY co DESC, title;

SELECT name FROM actor 
JOIN casting ON casting.actorid = actor.id 
JOIN movie ON casting.movieid = movie.id 
WHERE movie.id IN (SELECT movie.id FROM movie 
                   JOIN casting ON casting.movieid = movie.id 
                   JOIN actor ON casting.actorid = actor.id 
                   WHERE name LIKE 'Art Garfunkel')
AND name != 'Art Garfunkel';