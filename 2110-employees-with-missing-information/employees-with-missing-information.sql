# Write your MySQL query statement below
# Approach - 1 (using WITH and UNION clause)

WITH cte AS
(
SELECT e.employee_id AS employee_id
FROM employees e
INNER JOIN salaries s
ON e.employee_id = s.employee_id
)

SELECT e.employee_id AS employee_id
FROM employees e
LEFT JOIN cte c
ON e.employee_id = c.employee_id
WHERE c.employee_id IS NULL

UNION 

SELECT s.employee_id AS employee_id
FROM salaries s
LEFT JOIN cte c
ON s.employee_id = c.employee_id
WHERE c.employee_id IS NULL
ORDER BY employee_id

# Approach - 2 (Using union) (not efficient)
/*
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
*/
