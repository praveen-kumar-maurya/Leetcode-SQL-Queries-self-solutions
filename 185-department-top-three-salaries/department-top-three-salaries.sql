# Write your MySQL query statement below
WITH cte AS
(
SELECT e.name AS employee, d.name AS department,salary
,DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS rn
FROM employee e
INNER JOIN department d
ON e.departmentid = d.id
)

SELECT department, employee,salary
FROM cte
WHERE rn < 4; 