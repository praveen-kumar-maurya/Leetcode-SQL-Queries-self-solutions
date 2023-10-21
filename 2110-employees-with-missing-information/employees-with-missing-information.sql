# Write your MySQL query statement below
# Approach -1 (Using union)
SELECT employee_id
FROM employees
WHERE employee_id NOT IN 
(
SELECT e.employee_id
FROM employees e
INNER JOIN salaries s
ON e.employee_id = s.employee_id
)

UNION 

SELECT employee_id
FROM salaries
WHERE employee_id NOT IN 
(
SELECT e.employee_id
FROM employees e
INNER JOIN salaries s
ON e.employee_id = s.employee_id
)
ORDER BY employee_id;

