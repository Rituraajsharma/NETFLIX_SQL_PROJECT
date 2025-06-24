SELECT * FROM Netflix;

 SELECT COUNT(*) as total_contribution FROM Netflix;

 SELECT DISTINCT TYPE FROM Netflix;

 -- 15 Business Problems and Solutions

--1. Count the number of Movies Vs TV Shows?
--2. Find the most common rating for movies TV Shows?
--3. List all movies released in a specific year? (e.g.2020)
--4. Find the top 5 countries with the most content on netflix?
--5. Identify the longest movie or TV show duration?
--6. Find content add in the last 5 years?
--7. Find all the movies/Tv shows by director 'Rajiv Chilaka'?
--8. List all TV show with more than 5 seasons?
--9. Count the number of content items in each genre?
--10. Find the average realease year for content produced in a specific country?
--11. List all movies that are documentaries?
--12. Find all content withour a director?
--13. Find how many movies actor 'Salman Khan' appeared in last 10 years?
--14. Find the top 10 actors who have appeared in the highest number of movies produced in ?
--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content
-- containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category?





--Q.1. Count the number of Movies Vs TV Shows?

SELECT 
	type, 
	COUNT(*) as Total_Content 
FROM Netflix
GROUP BY type


--Q.2. Find the most common rating for movies TV Shows?

SELECT
    type,
    rating
FROM 
(
	SELECT
        type,
        rating,
        COUNT(*) AS total,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
	FROM Netflix
	GROUP BY type, rating
) AS t1
WHERE 
	ranking = 1;

--Q.3. List all movies released in a specific year? (e.g.2020)

SELECT * FROM Netflix
WHERE 
	type = 'Movie'
	AND 
	release_year = 2020;

--Q.4. Find the top 5 countries with the most content on netflix?

SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT(show_id) as total_content
FROM Netflix
GROUP BY new_country
ORDER BY total_content DESC
LIMIT 5;

--Q.5. Identify the longest movie duration?

SELECT * FROM Netflix
WHERE 
	type = 'Movie' 
	AND
	duration = (SELECT MAX(duration) FROM Netflix);

--Q.6. Find content add in the last 5 years?

SELECT * FROM Netflix
WHERE
	TO_DATE(date_added, 'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--Q.7. Find all the movies/Tv shows by director 'Rajiv Chilaka'?

SELECT * FROM Netflix
WHERE director LIKE '%Rajiv Chilaka%';


--Q.8. List all TV show with more than 5 seasons?

SELECT *
FROM Netflix
WHERE type = 'TV Show'
AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5;


--Q.9. Count the number of content items in each genre?

SELECT genre, COUNT(*) AS total_count
FROM (
  SELECT TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre
  FROM Netflix
) AS genres
GROUP BY genre
ORDER BY total_count DESC;

--Q.10. Find the average realease year for content produced in a specific country?

SELECT country, ROUND(AVG(release_year), 2) AS avg_release_year
FROM Netflix
WHERE country = 'India'
GROUP BY country;

--Q.11. List all movies that are documentaries?

SELECT * FROM Netflix
WHERE type = 'Movie' AND listed_in LIKE '%Documentaries%';

--Q.12. Find all content withour a director?

SELECT * FROM Netflix
WHERE director IS NULL;

--Q.13. Find how many movies actor 'Salman Khan' appeared in last 10 years?

SELECT * FROM Netflix
WHERE casts ILIKE '%Salman Khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--Q.14. Find the top 10 actors who have appeared in the highest number of movies produced in india?

SELECT 
UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
COUNT(*) as total_content
FROM Netflix
WHERE country ILIKE '%india'
Group BY actors
ORDER BY total_content DESC
LIMIT 10;

--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content
-- containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category?

WITH new_table
AS
(

SELECT *,
	CASE 
	WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'BAD_CONTENT'
		ELSE 'GOOD_CONTENT'
	END category
FROM Netflix 
)
SELECT 
	category,
	COUNT(*) as total_content
FROM new_table
GROUP BY 1

WHERE 
	description ILIKE '%kill%'
	OR
	description ILIKE '%violence%'

