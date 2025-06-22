
# 🎬 SQL Movie Dataset Analysis

This project demonstrates exploratory data analysis using **PostgreSQL** on a movie dataset. It covers data cleaning, general insights, box office trends, popularity, ratings, and awards.

---

## 🧱 Table Schema

```sql
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
```

---

## 🧹 Data Cleaning Queries

```sql
-- Check for missing movie titles
SELECT COUNT(*) FILTER (WHERE title IS NULL) AS null FROM movies;

-- Check for duplicate movie entries
SELECT title, year, COUNT(*) 
FROM movies
GROUP BY 1, 2
HAVING COUNT(*) > 1;
```

---

## 📊 1. General Insights

```sql
SELECT COUNT(title) AS all_movie FROM movies;
SELECT ROUND(AVG(rating), 1) AS avg_rating FROM movies;
SELECT year, COUNT(*) AS movie_count FROM movies GROUP BY year;
```

---

## 💰 2. Box Office & Budget Analysis

```sql
SELECT title, boxoffice_usd FROM movies ORDER BY boxoffice_usd DESC LIMIT 10;
SELECT title, boxoffice_usd - budget_usd AS profit FROM movies ORDER BY profit DESC LIMIT 1;
SELECT genre, ROUND(AVG(budget_usd), 2) AS avg_budget, ROUND(AVG(boxoffice_usd), 2) AS boxoffice FROM movies GROUP BY genre;
SELECT production_company, SUM(boxoffice_usd) AS grossing FROM movies GROUP BY production_company ORDER BY grossing DESC;
```

---

## 🌟 3. Ratings & Popularity

```sql
SELECT title, rating, votes FROM movies WHERE votes >= 10000 ORDER BY rating DESC;
SELECT genre, ROUND(AVG(rating), 2) AS avg_rating FROM movies GROUP BY genre ORDER BY avg_rating;
SELECT lead_actor, rating FROM movies GROUP BY 1, 2 ORDER BY rating DESC;
```

---

## 🏆 4. Awards & Recognition

```sql
SELECT director, num_awards FROM movies GROUP BY 1, 2 ORDER BY 2 DESC LIMIT 1;
SELECT 'genre' AS type_cat_genre, genre, ROUND(AVG(num_awards), 2) AS avg_awards FROM movies GROUP BY genre
UNION ALL
SELECT 'production_company', production_company, ROUND(AVG(num_awards), 2) FROM movies GROUP BY production_company ORDER BY avg_awards DESC;
SELECT genre, SUM(num_awards) AS awards_sum FROM movies GROUP BY genre ORDER BY awards_sum DESC;
```

---

## 🔍 5. Trend & Correlation Analysis

```sql
SELECT critic_reviews, rating FROM movies;
SELECT year, SUM(boxoffice_usd) AS revenue FROM movies GROUP BY year ORDER BY year;
```

---

## 🎬 6. People Insights

```sql
SELECT director, COUNT(*) AS movie_count FROM movies GROUP BY director ORDER BY movie_count DESC;
SELECT lead_actor, director, COUNT(*) AS actor_director FROM movies GROUP BY lead_actor, director ORDER BY actor_director DESC;
```

---

## 🌍 7. Language & Country Trends

```sql
SELECT country, COUNT(*) AS movie_num FROM movies GROUP BY country ORDER BY movie_num DESC;
SELECT language, COUNT(*) AS count_lang FROM movies GROUP BY language ORDER BY count_lang DESC;
```

---

## 📥 Sample Query to Preview Data

```sql
SELECT * FROM movies;
```

---

## 📌 Tools Used

- PostgreSQL (SQL syntax)
- GitHub for version control and sharing
- (Optional) Power BI or Excel for visualization

---

## 📢 Author

**Subhan Rahimoon**  
🎓 Aspiring Data Analyst | 💻 SQL Enthusiast  
📫 [LinkedIn](https://www.linkedin.com/) *(https://www.linkedin.com/in/subhan-rahimoon-931a35246/?trk=opento_sprofile_details)*

---

Feel free to fork, clone, and run your own SQL analysis on this dataset. Contributions and suggestions are welcome!
