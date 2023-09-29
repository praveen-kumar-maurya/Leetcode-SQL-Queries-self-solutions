# Write your MySQL query statement below

SELECT em.name AS employee
FROM employee AS em
JOIN employee AS m
ON em.managerId = m.id
WHERE em.salary > m.salary;