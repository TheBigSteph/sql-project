SELECT matchid, player FROM goal WHERE teamid = 'GER'

SELECT id,stadium,team1,team2 FROM game WHERE id = 1012

SELECT goal.player, goal.teamid,game.stadium, game.mdate 
  FROM game as game JOIN goal as goal ON (game.id=goal.matchid) 
       WHERE goal.teamid = 'GER'

SELECT game.team1, game.team2, goal.player 
  FROM game as game JOIN goal as goal ON(game.id = goal.matchid) 
       WHERE goal.player LIKE'Mario%'

SELECT goal.player, goal.teamid, eteam.coach,goal.gtime
  FROM goal as goal JOIN eteam as eteam ON (goal.teamid = eteam.id)
       WHERE goal.gtime<=10

SELECT game.mdate, eteam.teamname 
  FROM game as game JOIN eteam as eteam ON(eteam.id = game.team1) 
       WHERE eteam.coach = 'Fernando Santos'

SELECT goal.player 
  FROM goal as goal JOIN game as game ON(goal.matchid = game.id) 
       WHERE game.stadium = 'National Stadium, Warsaw'

SELECT DISTINCT goal.player
  FROM game as game JOIN goal as goal ON goal.matchid = game.id 
    WHERE (game.team1='GER' OR game.team2 ='GER') AND NOT goal.teamid = 'GER'

SELECT eteam.teamname, COUNT(goal.teamid) 
  FROM goal as goal JOIN eteam as eteam ON (goal.teamid = eteam.id) 
       GROUP BY eteam.teamname, goal.teamid

SELECT game.stadium, COUNT(goal.matchid) 
  FROM game as game JOIN goal as goal ON(game.id = goal.matchid)
       GROUP BY game.stadium

SELECT goal.matchid,game.mdate, COUNT(goal.matchid)
  FROM game as game JOIN goal as goal ON goal.matchid = game.id 
       WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
       GROUP BY goal.matchid, game.mdate

SELECT goal.matchid, game.mdate, COUNT(goal.matchid) 
  FROM game as game JOIN goal as goal ON(game.id = goal.matchid) 
       WHERE goal.teamid = 'GER' GROUP BY goal.matchid, game.mdate

SELECT game.mdate,game.team1,COUNT(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE null END) as score1,team2,
       COUNT(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE null END) as score2
  FROM game as game LEFT OUTER JOIN goal as goal ON goal.matchid = game.id
       GROUP BY game.mdate,game.team1,game.team2
