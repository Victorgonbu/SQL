SELECT population FROM world
WHERE name = 'Germany'

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

/*Select Basics Quizz*/

/*1*/

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

/*2*/
SELECT name, population
FROM world
WHERE name LIKE "Al%"
/*
Table-E
Albania	3200000
Algeria	32900000
*/

/*3*/
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l'

/*4*/
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'
/* 
name	length(name)
Italy	5
Malta	5
Spain	5
*/

/*5*/

/*Andorra	936*/

/*6*/

SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

/*7*/

SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')