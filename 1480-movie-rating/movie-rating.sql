# Write your MySQL query statement below

# Solution (Better)

(
SELECT u.name AS results
FROM users u
LEFT JOIN movierating mr
ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY COUNT(mr.rating) DESC, u.name ASC
LIMIT 1
)

UNION ALL

(
SELECT m.title AS results
FROM movies m
LEFT JOIN movierating mr
ON m.movie_id = mr.movie_id
WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1
)


# Alternate solution

/*
WITH cte AS
(
SELECT mr.*,u.name,m.title
FROM movierating mr
LEFT JOIN users u
ON mr.user_id = u.user_id
LEFT JOIN movies m
ON mr.movie_id = m.movie_id
)

(
SELECT name AS results
FROM cte
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1
)

UNION ALL

(
SELECT title
FROM cte
WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1
);
*/

