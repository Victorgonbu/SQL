SELECT matchid, player FROM goal WHERE teamid = 'GER';

SELECT id, stadium, team1, team2 FROM game WHERE id = (SELECT matchid FROM goal WHERE player LIKE '%Bender');

SELECT player, teamid, stadium, mdate FROM goal 
JOIN game ON (goal.matchid = game.id) 
JOIN eteam ON (eteam.id = goal.teamid) 
WHERE teamname = 'Germany';

SELECT team1, team2, player FROM game JOIN goal ON (game.id = goal.matchid) WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime from goal JOIN eteam ON goal.teamid = eteam.id WHERE gtime <=10; 

SELECT mdate, teamname FROM game JOIN eteam ON game.team1 = eteam.id WHERE coach = 'Fernando Santos';

SELECT player FROM goal JOIN game ON goal.matchid = game.id WHERE stadium LIKE 'National Stadium, W%';

SELECT DISTINCT player FROM goal JOIN game ON goal.matchid = game.id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';

SELECT teamname, COUNT(*) FROM eteam JOIN goal ON eteam.id = goal.teamid GROUP BY teamname;

SELECT stadium, COUNT(*) FROM game JOIN goal ON game.id = goal.matchid GROUP BY stadium;

SELECT game.id, game.mdate, COUNT(*)
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY game.id, game.mdate

SELECT matchid, mdate, COUNT(*) FROM goal JOIN game ON goal.matchid = game.id 
WHERE (game.team1 = 'GER' OR game.team2 = 'GER') AND teamid = 'GER' GROUP BY matchid, mdate;

SELECT game.mdate, 
       game.team1, 
       SUM(CASE WHEN goal.teamid = game.team1
           THEN 1
           ELSE 0
           END) AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2
           THEN 1
           ELSE 0
           END) AS score2
FROM game
LEFT JOIN goal
ON (game.id = goal.matchid)
GROUP BY mdate, team1, team2 ORDER by mdate, matchid, team1, team2

/*QUIZZ*/

/*1*/
/*game  JOIN goal ON (id=matchid)*/

/*2*/
/* matchid, teamid, player, gtime, id, teamname, coach*/

/*3*/
SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE")
AND teamid != 'GRE'
GROUP BY player, teamid;

/*4*/
SELECT DISTINCT teamid, mdate
FROM goal JOIN game on (matchid=id)
WHERE mdate = '9 June 2012';
/*
DEN	9 June 2012
GER	9 June 2012*/

/*5*/
SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

/*6*/
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA')) 

/*7*/
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid = id
GROUP BY teamname
HAVING COUNT(*) < 3
/*
Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2*/