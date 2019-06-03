/* Self join */

/* Question 1 */
SELECT COUNT(*)
FROM stops

/* Question 2 */
SELECT id
FROM stops
WHERE name='Craiglockhart'

/* Question 3 */
SELECT S2.id, S2.name
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Haymarket' AND S1.id=R1.stop
  AND R1.company=R2.company AND R1.num=R2.num
  AND R2.stop=S2.id AND R2.num='4'

/* Question 4 */
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)=2;

/* Question 5 */
SELECT a.company, a.num, a.stop, b.stop
FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

/* Question 6 */
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

/* Question 7 */
SELECT DISTINCT a.company, a.num
FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137

/* Question 8 */
SELECT a.company, a.num
FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

/* Question 9 */
SELECT stopb.name, a.company, a.num
FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

/* Question 10 */
SELECT
  a.num,
  a.company,
  stopc.name AS transfer,
  c.num,
  c.company
FROM route a
  JOIN route b
  ON ((a.company = b.company)
    AND
    (a.num = b.num))
  JOIN route c
  JOIN route d
  ON ((c.company = d.company )
    AND
    (c.num = d.num))
  JOIN stops stopa
  ON (a.stop = stopa.id)
  JOIN stops stopb
  ON (b.stop = stopb.id)
  JOIN stops stopc
  ON (c.stop = stopc.id)
  JOIN stops stopd
  ON (d.stop = stopd.id) 
WHERE
  (stopa.name = 'Craiglockhart')
  AND
  (stopd.name = 'Lochend')
  AND
  (stopb.name = stopc.name);

/* Quizz Answers
1.- C
2.- E
3.- D
*/