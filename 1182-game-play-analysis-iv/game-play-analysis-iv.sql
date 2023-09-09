# Write your MySQL query statement below
WITH cte_1 AS
(
SELECT player_id, MIN(event_date) AS first_login
FROM activity
GROUP BY player_id
),
cte_2 AS
(
    SELECT *, DATE_ADD(first_login, INTERVAL 1 DAY) AS next_day
    FROM cte_1
)

SELECT 
ROUND((SELECT COUNT(DISTINCT player_id)
FROM activity 
WHERE (player_id,event_date) IN (SELECT player_id,next_day FROM cte_2))/(SELECT COUNT(DISTINCT player_id) FROM activity),2) AS fraction