# Write your MySQL query statement below
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