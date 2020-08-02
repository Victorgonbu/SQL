SELECT SUM(population)
FROM world;

SELECT DISTINCT continent FROM world;

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

SELECT COUNT(*) as total FROM world WHERE area >= 1000000;

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(*) FROM world GROUP BY continent;

SELECT DISTINCT continent, (SELECT COUNT(*) from world WHERE continent = w.continent) FROM world AS w;

SELECT continent, COUNT(*) FROM world WHERE population > 10000000 GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

/*QUIZZ*/

/*1*/
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

/*2*/
SELECT COUNT(name) FROM bbc WHERE population < 150000

/*3: CORE SQL AGGREGATE FUNCTIONS*
AVG(), COUNT(), MAX(), MIN(), SUM() */

/*4*/
SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region
/*No result due to invalid use of the WHERE function*/

/*5*/
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

/*6*/
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY regio

/*7*/
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

/*8*/
SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000

/*Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710*/
