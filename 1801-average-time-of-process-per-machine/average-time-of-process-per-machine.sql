# Write your MySQL query statement below
# using window function
/*
WITH cte as
(SELECT *
, LEAD(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp) as end
FROM activity
)

SELECT machine_id
,ROUND(SUM(COALESCE((end-timestamp),0))/ COUNT(DISTINCT(process_id)),3) AS processing_time
FROM cte
GROUP BY machine_id;
*/


SELECT a1.machine_id AS machine_id, ROUND(avg(a2.timestamp - a1.timestamp),3) AS processing_time
FROM activity a1
JOIN activity a2
ON a1.machine_id = a2.machine_id
and a1.process_id = a2.process_id
and a1.activity_type = 'start' and a2.activity_type = 'end'
GROUP BY a1.machine_id;