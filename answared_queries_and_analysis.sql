-- Creating Table 

CREATE TABLE movies (
    title TEXT,
    year INT,
    director TEXT,
    duration INT,  -- in minutes
    rating NUMERIC(3,1),
    votes INT,
    description TEXT,
    language TEXT,
    country TEXT,
    budget_usd BIGINT,
    boxoffice_usd BIGINT,
    genre TEXT,
    production_company TEXT,
    content_rating TEXT,
    lead_actor TEXT,
    num_awards INT,
    critic_reviews INT
);

--- Data Cleaning Process

 SELECT COUNT(*) FILTER (WHERE title IS NULL) AS null FROM movies;

 SELECT title ,year , COUNT(*) FROM movies
 GROUP BY 1 ,2
 HAVING  count(*) > 1;

-- 1. General Insights

-- How many movies are in the dataset?
 SELECT COUNT(title) As All_movie FROM movies;

-- What is the average rating of all movies?

 SELECT ROUND(AVG(rating),1) AS avg_rating FROM movies;

-- How many movies are released each year?

SELECT year , COUNT(*) AS movie_count FROM movies 
GROUP BY year;

-- 2. Box Office & Budget Analysis

-- Which 10 movies earned the most at the box office?

 SELECT title , boxoffice_usd FROM movies
 ORDER BY boxoffice_usd DESC
 LIMIT 10;

 -- Which movies made the highest profit (boxoffice_usd - budget_usd)?

 SELECT title , boxoffice_usd -  budget_usd AS profit FROM movies
 ORDER BY profit DESC
 LIMIT 1;

 -- What is the average budget vs average box office by genre?

  SELECT genre , 
	  ROUND(AVG(budget_usd), 2) AS avg_budget  ,
	  ROUND(AVG(boxoffice_usd) , 2) AS boxoffice FROM movies
  GROUP BY genre;

 -- Which production companies have the highest-grossing movies?

 SELECT production_company , SUM(boxoffice_usd) AS grossing FROM movies 
 GROUP BY 1 
 ORDER BY grossing DESC;
 
-- 3. Ratings & Popularity
-- Which movies have the highest rating (with at least 10,000 votes)?
 SELECT title , rating , votes FROM movies
 WHERE votes >= 10000
 ORDER BY rating DESC;

-- What is the average rating per genre?
 SELECT genre , ROUND(AVG(rating) , 2) AS avg_rating FROM movies
 GROUP BY genre
 ORDER BY avg_rating;

 -- Which lead actors have the most highly rated movies?

 SELECT lead_actor , rating FROM movies
 GROUP BY 1,2
 ORDER BY rating DESC;

 --  4. Awards & Recognition
 -- Which director has won the most awards across all movies?
 SELECT  director, num_awards FROM movies
 GROUP BY 1 ,2 
 ORDER BY 2 DESC
 LIMIT 1;

 -- What is the average number of awards by genre or production company?
 SELECT  'genre' AS type_cat_genre , genre , ROUND(AVG(num_awards),2) AS avg_awards FROM movies
 GROUP BY genre
 UNION ALL
 SELECT 'production_company' as production_companies ,production_company , ROUND(AVG(num_awards),2) AS avg_awards FROM movies
 GROUP BY production_company
 ORDER BY avg_awards DESC;
 


 
select * from movies;

-- Is there a correlation between critic reviews and ratings
SELECT critic_reviews , rating FROM movies;


-- What is the trend of box office revenue over the years?
 SELECT year , SUM(boxoffice_usd) AS revenue FROM movies
 GROUP BY year
 ORDER BY year;

-- Which directors have directed the most movies?
 SELECT director , count(*) AS movie_count FROM movies
 GROUP BY director
 ORDER BY movie_count DESC;

-- Which actor-director combinations are most common?
 SELECT lead_actor , director , count(*) AS actor_director FROM movies
 GROUP BY lead_actor , director 
 ORDER BY actor_director DESC;

 -- Which genre produces the most award-winning movies?
 SELECT genre , SUM(num_awards) AS awards_sum FROM movies 
 GROUP BY genre 
 ORDER BY awards_sum DESC;


