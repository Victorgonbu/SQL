SELECT name FROM teacher WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id);

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON dept.id = teacher.dept;

SELECT COUNT(name) AS num_teacher, COUNT(mobile) AS num_mobile FROM teacher;

SELECT dept.name, COUNT(teacher.dept) FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id GROUP BY dept.name;

SELECT name,
CASE WHEN teacher.dept IN ('1', '2') THEN 'Sci' ELSE 'Art' END FROM teacher;

SELECT name,
CASE WHEN teacher.dept IN ('1', '2') THEN 'Sci' WHEN teacher.dept = '3' THEN 'Art' ELSE 'None' END FROM teacher;

/*QUIZZ*/

/*1*/
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

/*2*/
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

/*3*/
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

/*4*/
/*display 0 in result column for all teachers without department*/

/*5*/
SELECT name,
CASE WHEN phone = 2752 THEN 'two'
WHEN phone = 2753 THEN 'three'
WHEN phone = 2754 THEN 'four'
END AS digit
FROM teacher
/*'four' for Throd*/

/*6*/
SELECT name, 
CASE 
WHEN dept 
IN (1) 
THEN 'Computing' 
ELSE 'Other' 
END 
FROM teacher
/*Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other*/
