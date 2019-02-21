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