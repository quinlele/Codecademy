# SELECT is used every time you want to query data from a database. We can select individual columns by their names (separated by a comma)
SELECT name, genre, year
FROM movies;

# AS is a keyword in SQL that allows you to rename a column or table using an alias
SELECT name AS 'Titles'
FROM movies;

# DISTINCT is used to return unique values in the output
SELECT DISTINCT genre 
FROM movies;

# We can restrict our query results using the WHERE clause in order to obtain only the information we want
SELECT * 
FROM movies 
WHERE imdb_rating < 5;

# LIKE can be a useful operator when you want to compare similar values. The _ means you can substitute any individual character here without breaking the pattern
SELECT *
FROM movies
WHERE name LIKE 'Se_en';

# % is a wildcard character that matches zero or more missing letters in the pattern
SELECT *
FROM movies
WHERE name LIKE 'The %';

# Unknown values are indicated by NULL
SELECT name
FROM movies
WHERE imdb_rating IS NULL;

# The BETWEEN operator is used in a WHERE clause to filter the result set within a certain range
SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979;

# AND is used to combine multiple conditions in a WHERE clause to make the result set more specific and useful
SELECT *
FROM movies
WHERE year < 1985
	AND genre = 'horror';
  
# The OR operator can also be used to combine multiple conditions in WHERE
SELECT *
FROM movies
WHERE genre = 'romance'
	OR genre = 'comedy';
  
# We can sort the results using ORDER BY, either alphabetically or numerically
SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;

# LIMIT is a clause that lets you specify the maximum number of rows the result set will have
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;

# A CASE statement allows us to create different outputs (usually in the SELECT statement). It is SQL’s way of handling if-then logic
SELECT name,
	CASE
		WHEN genre = 'romance' THEN 'Chill'
		WHEN genre = 'comedy' THEN 'Chill'
		ELSE 'Intense'
	END AS 'Mood'
FROM movies;
