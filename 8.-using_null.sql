/*Using Null*/

/* Question 1 */
SELECT name
FROM teacher
WHERE dept IS NULL

/* Question 2 */
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
  ON (teacher.dept=dept.id)

/* Question 3 */
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
  ON (teacher.dept=dept.id)

/* Question 4 */
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
  ON (teacher.dept=dept.id)


/* Question 5 */
SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher

/* Question 6 */
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
  ON (teacher.dept=dept.id)

/* Question 7 */
SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher

/* Question 8 */
SELECT dept.name, COUNT(teacher.dept)
FROM teacher RIGHT JOIN dept
  ON (teacher.dept=dept.id)
GROUP BY dept.name

/* Question 9 */
SELECT name,
  CASE WHEN dept IS NOT NULL THEN 'Sci'
  ELSE 'Art' END
FROM teacher

/* Question 10 */
SELECT name,
  CASE WHEN dept IS NOT NULL THEN 'Sci'
  WHEN dept=3 THEN 'Art'
  ELSE 'None' END
FROM teacher

/* Quizz Answers
1.- E
2.- C
3.- E
4.- B
5.- A
6.- A
*/