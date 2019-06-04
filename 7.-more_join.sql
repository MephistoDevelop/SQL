/*More JOIN operations */

/* Question 1 */
SELECT
  id,
  title
FROM movie
WHERE
(yr = 1962);

/* Question 2 */
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

/* Question 3 */
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

/* Question 4*/
SELECT id
FROM actor
WHERE name = 'Glenn Close';

/* Question 5 */
SELECT id
FROM movie
WHERE title = 'Casablanca';

/* Question 6 */
SELECT name
FROM actor
  JOIN casting
  ON id = actorid
WHERE movieid = 11768;

/* Question 7 */
SELECT name
FROM actor
  JOIN casting
  ON id = actorid
  JOIN movie
  ON movieid = movie.id
WHERE title = 'Alien';

/* Question 8 */
SELECT title
FROM movie
  JOIN casting
  ON movie.id = movieid
  JOIN actor
  ON actorid = actor.id
WHERE name = 'Harrison Ford';

/* Question 9 */
SELECT title
FROM movie
  JOIN casting
  ON movie.id = movieid
  JOIN actor
  ON actorid = actor.id
WHERE name = 'Harrison Ford' AND ord != 1;

/* Question 10 */
SELECT title, name
FROM movie
  JOIN casting
  ON movie.id = movieid
  JOIN actor
  ON actorid = actor.id
WHERE yr = 1962 AND ord = 1;

/* Question 11 */
SELECT
  movie.yr,
  COUNT(movie.title)
FROM movie
  JOIN casting
  ON (movie.id = casting.movieid)
  JOIN actor
  ON (casting.actorid = actor.id)
WHERE
  (actor.name = 'John Travolta')
GROUP BY movie.yr
HAVING (COUNT(movie.title) = (SELECT
  MAX(c)
FROM (SELECT
    movie.yr,
    COUNT(movie.title) AS c
  FROM movie
    JOIN casting
    ON (movie.id = casting.movieid)
    JOIN actor
    ON (casting.actorid = actor.id)
  WHERE
                                      (actor.name = 'John Travolta')
  GROUP BY movie.yr) AS t));

/* Question 12 */
SELECT
  movie.title,
  actor.name
FROM movie
  JOIN casting
  ON (movie.id = casting.movieid )
  JOIN actor
  ON (actor.id = casting.actorid)
WHERE
  casting.movieid IN (SELECT
    casting.movieid
  FROM casting
  WHERE
                        actorid IN (SELECT
    actor.id
  FROM actor
  WHERE
                                      actor.name = 'Julie Andrews'))
  AND
  (casting.ord = 1);

/* Question 13 */
SELECT name
FROM actor
  JOIN casting ON actorid=actor.id
  JOIN movie ON movieid=movie.id
WHERE ord=1
GROUP BY name
HAVING COUNT(ord)>=30;

/* Question 14 */
SELECT title, COUNT(actorid)
FROM movie
  JOIN casting ON casting.movieid=movie.id
WHERE movie.yr='1978'
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC;


/* Question 15 */
SELECT name
FROM actor JOIN casting ON actor.id = actorid
WHERE movieid IN
  (SELECT id
  FROM movie
  WHERE title IN
    (SELECT title
  FROM movie JOIN casting ON movie.id = movieid
  WHERE actorid IN
      (SELECT id
  FROM actor
  WHERE name = 'Art Garfunkel')))
  AND name != 'Art Garfunkel'

/* Quizz Answers
1.- C
2.- E
3.- C
4.-B
5.- D
6.- C
7.- B
*/