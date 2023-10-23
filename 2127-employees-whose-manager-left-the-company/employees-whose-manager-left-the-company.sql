# Write your MySQL query statement below
WITH cte as
(
SELECT *
FROM employees
WHERE salary < 30000
)

SELECT employee_id
FROM cte 
WHERE manager_id IS NOT NULL AND manager_id  NOT IN (SELECT employee_id FROM employees)
ORDER BY employee_id;