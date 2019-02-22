SELECT name FROM teacher WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

SELECT t.name, d.name 
  FROM teacher t LEFT OUTER JOIN dept d ON t.dept = d.id

SELECT t.name, d.name 
  FROM teacher t RIGHT OUTER JOIN dept d ON t.dept = d.id

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

SELECT t.name, COALESCE(d.name, 'None') 
  FROM teacher t LEFT OUTER JOIN dept d ON t.dept = d.id

SELECT COUNT(name), COUNT(mobile) FROM teacher

SELECT d.name, COUNT(t.name) 
  FROM teacher t RIGHT OUTER JOIN dept d ON t.dept = d.id GROUP BY d.name

SELECT t.name ,CASE WHEN t.dept IS NULL  THEN 'Art' ELSE 'Sci' END FROM teacher t

SELECT t.name ,CASE WHEN t.dept = 1 OR t.dept = 2 THEN 'Sci' WHEN t.dept = 3 THEN 'Art' ELSE 'None' END FROM teacher t
