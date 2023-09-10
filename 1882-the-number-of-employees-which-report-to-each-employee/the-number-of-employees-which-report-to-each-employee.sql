# Write your MySQL query statement below
SELECT manager.employee_id AS employee_id, manager.name as name, COUNT(employee.employee_id) as reports_count, ROUND(AVG(employee.age),0) as average_age
FROM employees employee
JOIN employees manager
ON employee.reports_to = manager.employee_id
GROUP BY manager.employee_id, manager.name
ORDER BY manager.employee_id;