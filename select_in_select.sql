SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name FROM world 
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name LIKE 'United Kingdom');

SELECT name, continent FROM world 
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
OR continent = (SELECT continent FROM world WHERE name = 'Australia') ORDER BY name;

SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland');

SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany')), '%') AS percentage 
FROM world WHERE continent ='Europe';

SELECT name 
FROM world 
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

SELECT continent, name, area 
FROM world
WHERE area IN (SELECT MAX(area) 
                  FROM world 
                 GROUP BY continent);

SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0);

SELECT name, continent FROM world AS w1 
WHERE population >= All (SELECT population*3 FROM world AS w2 WHERE w1.continent = w2.continent AND w1.name <> w2.name);

/*QUIZZ*/

/*1*/
SELECT region, name, population FROM bbc x 
WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);

/*2*/
SELECT name,region,population FROM bbc x 
WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);

/*3*/
SELECT name, region FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);

/*4*/
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom');

/*
Table-D
France
Germany
Russia
Turkey*/

/*5*/
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

/*6*/
SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark');

/*7*/

SELECT name FROM bbc
WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
AND region = 'South Asia';

/*
Table-B
Bangladesh
India
Pakistan*/
                