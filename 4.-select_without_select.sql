/*SELECT within SELECT Tutorial */

/* Question 1 */
SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia');

/* Question 2*/
SELECT name
FROM world
WHERE continent = 'Europe'
  AND gdp/population > (SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');

/* Question 3 */
SELECT name, continent
FROM world
WHERE continent = (SELECT continent
  FROM world
  WHERE name LIKE '%Argentina%')
  OR continent = (SELECT continent
  FROM world
  WHERE name LIKE '%Australia%')
ORDER BY name;

/* Question 4 */
SELECT name, population
FROM world
WHERE population > (SELECT population
  FROM world
  WHERE name LIKE '%Canada%')
  AND population < (SELECT population
  FROM world
  WHERE name LIKE '%Poland%');

/* Question 5 */
SELECT name, CONCAT(ROUND(100*population/(SELECT population
  FROM world
  WHERE name = 'Germany')),'%')
FROM world
WHERE continent = 'Europe';

/* Question 6 */
SELECT name
FROM world
WHERE gdp >(SELECT MAX(gdp)
FROM world
WHERE continent = 'Europe')
ORDER BY gdp DESC;

/* Question 7 */
SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
  AND population>0)

/* Question 8 */
SELECT continent, MIN(name) AS name
FROM world
GROUP BY continent
ORDER by continent

/* Question 9 */
SELECT name, continent, population
FROM world x
WHERE 25000000>=ALL (SELECT population
FROM world y
WHERE x.continent=y.continent
  AND population>0)

/* Question 10 */
SELECT name, continent
FROM world x
WHERE
 population > ALL
 (SELECT population*3
FROM world y
WHERE y.continent = x.continent
  AND y.name != x.name)
;

/* Quizz Answers
1.-C
2.- B
3.- A
4.- D
5.- B
6.-B
7.- B
*/
