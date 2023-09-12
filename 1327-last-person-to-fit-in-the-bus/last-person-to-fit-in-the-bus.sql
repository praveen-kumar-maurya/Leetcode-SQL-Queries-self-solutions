# Write your MySQL query statement below
WITH cte AS
(
SELECT *, SUM(weight) OVER ( order by turn) AS total_weight
FROM queue
)

SELECT person_name
FROM cte
WHERE person_id NOT IN 
(
SELECT COALESCE(person_id, 0)
FROM cte
WHERE total_weight > 1000
) 
ORDER BY turn DESC
LIMIT 1;