# Write your MySQL query statement below

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

/*
SELECT e.employee_id as 
FROM employees e
FULL OUTER JOIN salaries s
ON e.employee_id = s.employee_id
WHERE s.name IS NULL OR e.salary IS NULL;
*/