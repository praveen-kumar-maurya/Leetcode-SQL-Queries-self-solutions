# Write your MySQL query statement below
WITH cte AS
(
SELECT *, out_time-in_time AS working_time
FROM employees
)

SELECT event_day AS day, emp_id, SUM(working_time) AS total_time
FROM cte
GROUP BY event_day, emp_id