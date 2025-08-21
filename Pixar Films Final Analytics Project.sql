
USE pixar_db;

-- Films with missing box office or budget data
SELECT 
    film,
    box_office_worldwide,
    budget
FROM box_office
WHERE box_office_worldwide IS NULL OR budget IS NULL;

-- Calculate ROI only for films with complete financial data
SELECT 
    film,
    box_office_worldwide,
    budget,
    ROUND((box_office_worldwide - budget) / budget, 2) AS roi
FROM box_office
WHERE box_office_worldwide IS NOT NULL AND budget IS NOT NULL;
 
 -- Replace NULL cinema scores with 'Unknown'
SELECT 
    film,
    COALESCE(cinema_score, 'Unknown') AS cinema_score
FROM public_response;

-- IMDb average only where the score exists
SELECT 
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM public_response
WHERE imdb_score IS NOT NULL;

-- Count of missing values in key review columns
    select SUM(CASE WHEN imdb_score IS NULL THEN 1 ELSE 0 END) AS missing_imdb,
    SUM(CASE WHEN metacritic_score IS NULL THEN 1 ELSE 0 END) AS missing_metacritic,
    SUM(CASE WHEN rotten_tomatoes_score IS NULL THEN 1 ELSE 0 END) AS missing_rotten
FROM public_response;
 
 
-- Top 5 highest grossing films with director names
SELECT 
    b.film,
    b.box_office_worldwide,
    p.name AS director_name
FROM box_office b
JOIN pixar_people p 
    ON b.film = p.film AND p.role_type = 'Director'
ORDER BY b.box_office_worldwide DESC
LIMIT 5;

-- Critically successful but not commercially 
SELECT 
    pr.film,
    pr.rotten_tomatoes_score,
    b.box_office_worldwide,
    b.budget
FROM public_response pr
JOIN box_office b ON pr.film = b.film
WHERE pr.rotten_tomatoes_score >= 90 AND b.box_office_worldwide < b.budget;

-- imdb and metacritic review score by genre 

SELECT 
g.value AS genre,
    ROUND(AVG(pr.imdb_score), 2) AS avg_imdb,
    ROUND(AVG(pr.metacritic_score), 2) AS avg_meta
FROM genres g
JOIN public_response pr ON g.film = pr.film
WHERE g.category = 'Genre'
GROUP BY g.value
ORDER BY avg_imdb DESC;

-- fims with A+ cinema score and high Roi
SELECT 
    b.film,
    b.box_office_worldwide,
    b.budget,
    ROUND((b.box_office_worldwide - b.budget) / b.budget, 2) AS roi
FROM box_office b
JOIN public_response pr ON b.film = pr.film
WHERE pr.cinema_score = 'A+'
ORDER BY roi DESC;

-- Correlation between IMDb Score and Box Office
SELECT 
    FLOOR(pr.imdb_score) AS imdb_score_range,
    ROUND(AVG(b.box_office_worldwide)) AS avg_revenue
FROM public_response pr
JOIN box_office b ON pr.film = b.film
GROUP BY FLOOR(pr.imdb_score)
ORDER BY imdb_score_range DESC;
  
  --- Contribution Frequency of Key Directors
SELECT 
    name AS director,
    COUNT(*) AS films_directed
FROM pixar_people
WHERE role_type = 'Director'
GROUP BY name
ORDER BY films_directed DESC;

--- Genre Impact on Awards

SELECT 
    g.value AS genre,
    COUNT(DISTINCT a.film) AS total_award_nominations
FROM genres g
JOIN academy a ON g.film = a.film
WHERE g.category = 'Genre'
GROUP BY g.value
ORDER BY total_award_nominations DESC;







