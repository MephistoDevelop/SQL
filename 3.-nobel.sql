/*SELECT from Nobel Tutorial */

/* Question 1 */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

/* Question 2 */
SELECT winner
FROM nobel
WHERE yr = 1962
  AND subject = 'Literature';

/* Question 3 */
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

/* Question 4 */
SELECT winner
FROM nobel
WHERE subject = 'Peace'
  AND yr > 1999;

/* Question 5 */
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 and 1989 AND
  subject = 'Literature';

/* Question 6 */
SELECT *
FROM nobel
WHERE  winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama')

/* Question 7 */
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

/* Question 8 */
SELECT *
FROM nobel
WHERE  subject = 'Physics'
  AND yr = 1980 OR subject = 'Chemistry'
  AND yr = 1984;

/* Question 9 */
SELECT *
FROM nobel
WHERE subject != 'Chemistry' AND subject != 'Medicine' AND yr =1980;

/* Question 10 */
SELECT *
FROM nobel
WHERE subject = 'Medicine' AND yr <1910 OR subject = 'Literature' AND yr >2003;

/* Question 11 */
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

/* Question 12 */
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL ';

/* Question 13 */
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

/* Question 14 */
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject
IN
('Chemistry','Physics'),
 subject,winner;

/* Quizz Answers
1.- D
2.- C
3.- B
4.- C
5.- C
6.- C
7.- E
*/
