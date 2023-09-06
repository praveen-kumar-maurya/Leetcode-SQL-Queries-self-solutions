# Write your MySQL query statement below
SELECT a.name AS name
FROM
(
  SELECT e1.id,e1.name AS name, COUNT(e1.id) AS direct_reports
  FROM employee e1
  JOIN employee e2
  ON e1.id != e2.Id AND e1.id = e2.managerId
  GROUP BY e1.id,e1.name
) a
WHERE a.direct_reports >= 5;