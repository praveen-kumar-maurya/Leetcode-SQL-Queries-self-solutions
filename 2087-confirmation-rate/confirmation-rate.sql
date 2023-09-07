# Write your MySQL query statement below
/*
# Using CTE
WITH cte AS
(
  SELECT s.user_id as user_id
, SUM(CASE WHEN action ='confirmed' THEN 1 ELSE 0 END ) AS total_confirmed,
 COUNT(c.user_id) AS total_requests
FROM signups AS s
LEFT JOIN confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id
)

SELECT user_id, COALESCE(ROUND((total_confirmed/total_requests),2),0
 ) AS confirmation_rate
FROM cte;
*/

# Simple
SELECT s.user_id as user_id
, COALESCE(ROUND((SUM(CASE WHEN action ='confirmed' THEN 1 ELSE 0 END ) / COUNT(c.user_id)),2),0) AS confirmation_rate
FROM signups AS s
LEFT JOIN confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id