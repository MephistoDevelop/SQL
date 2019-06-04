/*The JOIN operation */

/* Question 1 */
SELECT matchid, player
FROM goal
WHERE teamid LIKE '%GER';

/* Question 2 */
SELECT id, stadium, team1, team2
FROM game
WHERE id = '1012';

/* Question 3 */
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid='GER'

/* Question 4 */
SELECT team1, team2, player
FROM game
  JOIN goal ON (game.id = goal.matchid)
WHERE goal.player LIKE 'Mario%';

/* Question 5 */
SELECT player, teamid, coach, gtime
FROM goal
  JOIN eteam on (goal.teamid=eteam.id)
WHERE gtime<=10

/* Question 6 */
SELECT mdate, teamname
FROM game
  JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'
;

/* Question 7 */
SELECT player
FROM goal
  JOIN game ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw';

/* Question 8 */
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id
WHERE (team1='GER' OR team2='GER')
  AND teamid != 'GER'

/* Question 9 */
SELECT teamname, COUNT(matchid)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

/* Question 10 */
SELECT stadium, COUNT(matchid)
FROM game
  JOIN goal ON (id = matchid)
GROUP BY stadium
ASC;

/* Question 11 */
SELECT matchid, mdate, COUNT(id)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP by matchid,mdate
ORDER BY COUNT(id) DESC;

/* Question 12 */
SELECT matchid, mdate, COUNT(teamid)
FROM goal
  JOIN game ON (matchid = id)
WHERE teamid = 'GER'
GROUP BY matchid,mdate

/* Question 13 */
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
  LEFT JOIN goal
  ON matchid = id
GROUP by mdate, matchid, team1, team2;

/* Quizz Answers
1.- D
2.- C
3.- A
4.- A
5.- B
6.- C
7.- B
*/