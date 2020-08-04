SELECT COUNT(*) FROM stops;

SELECT id FROM stops WHERE name LIKE 'Craiglockhart';

SELECT id, name FROM stops JOIN route ON route.stop = stops.id WHERE route.company LIKE 'LRT' AND route.num = '4';

SELECT company, num, COUNT(*) AS c
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING c >= 2;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name LIKE 'london Road';

SELECT r.company, r.num FROM route r 
JOIN route r2 ON (r.company = r2.company AND r.num = r2.num) 
JOIN stops a ON (a.id = r.stop) 
JOIN stops a1 ON (a1.id = r2.stop) WHERE a.name = 'Craiglockhart' AND a1.name = 'Tollcross';

SELECT DISTINCT s1.name,a.company,a.num FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num) JOIN stops s1 ON a.stop = s1.id
JOIN stops s2 ON b.stop = s2.id WHERE s1.name = 'Craiglockhart' or s2.name = 'Craiglockhart' ORDER BY a.num

SELECT 
  firstbus.busnumber AS 'num', 
  firstbus.company, 
  secondbus.transfer AS 'name', 
  secondbus.busnumber AS 'num', 
  secondbus.company 
FROM (
  SELECT r1.num AS 'busnumber', 
  r1.company AS 'company', 
  r2.stop AS 'stopp' 
  FROM route r1 
  JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) 
  JOIN stops s1 ON s1.id = r1.stop
  JOIN stops s2 ON s2.id = r2.stop
  WHERE s1.name = 'Craiglockhart'
  ) firstbus
  JOIN
  (
  SELECT s1.name AS 'transfer', 
  r1.num AS 'busnumber', 
  r1.company AS 'company', 
  r1.stop AS 'stopp', 
  r1.pos AS 'pos' 
  FROM route r1 JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) 
  JOIN stops s1 ON s1.id = r1.stop
  JOIN stops s2 ON s2.id = r2.stop
  WHERE s2.name = 'Lochend'
  ) secondbus
  ON firstbus.stopp = secondbus.stopp
ORDER BY firstbus.busnumber, name, 4;

/*QUIZZ*/

/*1*/
SELECT DISTINCT a.name, b.name
FROM stops a JOIN route z ON a.id=z.stop
JOIN route y ON y.num = z.num
JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket';

/*2*/
SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
AND R1.company=R2.company AND R1.num=R2.num
AND R2.stop=S2.id AND R2.num='2A';

/*3*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross'



