# Write your MySQL query statement below
SELECT e2.employee_id AS employee_id, e2.name as name, COUNT(*) as reports_count, ROUND(AVG(e1.age),0) as average_age
FROM employees e1
JOIN employees e2
ON e1.reports_to = e2.employee_id
GROUP BY e2.employee_id, e2.name
ORDER BY e2.employee_id;