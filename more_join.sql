SELECT id, title
FROM movie
WHERE yr=1962;

SELECT yr FROM movie WHERE title = 'Citizen Kane';

SELECT  id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;

SELECT id FROM actor WHERE name = 'Glenn Close';

SELECT id FROM movie WHERE title = 'Casablanca';

SELECT actor.name FROM casting JOIN actor ON (actor.id = casting.actorid) WHERE movieid = '11768';