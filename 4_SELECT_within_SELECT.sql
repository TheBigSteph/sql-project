SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')

SELECT name FROM world WHERE continent = 'Europe' 
                       AND gdp / population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

SELECT name, continent FROM world 
       WHERE continent IN(SELECT continent FROM world 
                                 WHERE name IN('Argentina', 'Australia')) ORDER BY name

SELECT name, population FROM world 
       WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
       AND population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND((population / (SELECT population FROM world WHERE name='Germany') * 100)),'%') 
              FROM world WHERE continent = 'Europe'

SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE continent ='Europe' AND gdp > 0)

SELECT continent, name, area FROM world x
       WHERE area >= ALL(SELECT area FROM world y
                                WHERE y.continent = x.continent AND area>0)

SELECT continent,name FROM world x 
       WHERE name = (SELECT name FROM world y WHERE x.continent = y.continent ORDER BY name LIMIT 1) 
       GROUP BY continent,name

SELECT name,continent, population FROM world x 
       WHERE 25000000 >= ALL(SELECT population FROM world y 
                                    WHERE x.continent = y.continent) GROUP BY continent,name, population

SELECT name, continent FROM world x 
       WHERE population > ALL(SELECT 3 * population FROM world y 
                                     WHERE x.continent = y.continent
                                     AND NOT x.name = y.name)
       GROUP BY continent,name,population
