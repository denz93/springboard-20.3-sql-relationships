-- 1.
SELECT g.matchid, g.player FROM goal as g
WHERE g.teamid = 'GER'

-- 2.
SELECT id,stadium,team1,team2 FROM game
WHERE id=1012

-- 3.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER'

-- 4.
SELECT team1, team2, player
FROM goal JOIN game ON (goal.matchid = game.id)
WHERE player LIKE 'Mario%'

-- 5.
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid=eteam.id)
WHERE gtime<=10

-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

-- 7.
SELECT player
FROM goal JOIN game ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw'

-- 8.
SELECT player
FROM goal JOIN game ON (game.id = goal.matchid)
WHERE goal.teamid != 'GER' AND (game.team1 = 'GER' or game.team2 = 'GER')
GROUP BY (player)

-- 9.
SELECT teamname, COUNT(id) as goals_scored
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname

-- 10.
SELECT stadium, COUNT(*) as goals
FROM game JOIN goal ON (id=matchid)
GROUP BY stadium

-- 11.
SELECT matchid,mdate, COUNT(*) as goals
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

-- 12.
SELECT matchid, mdate, COUNT(*) as goals
FROM game JOIN goal ON id = matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate

-- 13.
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END ) as score2
FROM game JOIN goal ON matchid = id
GROUP BY mdate, team1, team2, matchid
ORDER BY mdate, matchid, team1, team2
