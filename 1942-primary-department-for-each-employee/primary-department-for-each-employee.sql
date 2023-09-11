# Write your MySQL query statement below
WITH cte AS
(
SELECT *
, COUNT(*) OVER(PARTITION BY employee_id ORDER BY department_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS department_count
FROM employee
)

SELECT employee_id, department_id
FROM cte
WHERE department_count > 1 and primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM cte
WHERE department_count = 1;
