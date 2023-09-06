# Write your MySQL query statement below
WITH cte as
(SELECT *
, LEAD(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp) as end
FROM activity
)
/*
SELECT 
timestamp, end,COALESCE((end-timestamp),0)
FROM cte
GROUP BY machine_id;
*/

SELECT machine_id
,ROUND(SUM(COALESCE((end-timestamp),0))/ COUNT(DISTINCT(process_id)),3) AS processing_time
FROM cte
GROUP BY machine_id;
