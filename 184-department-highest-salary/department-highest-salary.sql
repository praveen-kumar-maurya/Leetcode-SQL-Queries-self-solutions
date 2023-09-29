# Write your MySQL query statement below
WITH cte AS
(
SELECT d.name AS department, e.name AS employee, e.salary AS salary
, DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rn
FROM employee e
INNER JOIN department d
ON e.departmentId = d.id
)

SELECT department,employee,salary
FROM cte
WHERE rn = 1;