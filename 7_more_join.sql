SELECT id, title FROM movie WHERE yr=1962

SELECT yr FROM movie WHERE title = 'Citizen Kane'

SELECT DISTINCT movie.id, movie.title, movie.yr FROM movie JOIN casting WHERE casting.movieid = movie.id AND movie.title LIKE 'Star Trek%' ORDER BY yr

SELECT id FROM actor WHERE name = 'Glenn Close'

SELECT id FROM movie WHERE title = 'Casablanca'

SELECT actor.name FROM actor JOIN casting WHERE casting.actorid = actor.id AND movieid = 11768

SELECT name FROM actor a JOIN casting c WHERE c.actorid = a.id AND c.movieid = (SELECT movie.id FROM movie WHERE title = 'Alien')

SELECT title FROM movie m JOIN casting c WHERE  c.movieid = m.id AND c.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

SELECT title FROM movie m JOIN casting c WHERE  c.movieid = m.id AND c.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1

SELECT title, name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE yr = 1962 AND ord = 1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

SELECT movie.title, actor.name FROM movie JOIN casting ON (movie.id = casting.movieid AND ord = 1) JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'))

SELECT a.name FROM casting c JOIN actor a ON a.id = c.actorid AND ord = 1 GROUP BY a.name HAVING COUNT(a.name) >= 30


SELECT m.title, COUNT(c.actorid) FROM movie m JOIN casting c ON m.id = c.movieid WHERE m.yr = 1978 GROUP BY m.title, m.yr ORDER BY COUNT(c.actorid) DESC, m.title

SELECT a.name FROM casting c JOIN actor a ON c.actorid = a.id WHERE c.movieid IN (SELECT m.id FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON c.actorid = a.id
WHERE a.name = 'Art Garfunkel' GROUP BY m.id) AND a.name != 'Art Garfunkel'