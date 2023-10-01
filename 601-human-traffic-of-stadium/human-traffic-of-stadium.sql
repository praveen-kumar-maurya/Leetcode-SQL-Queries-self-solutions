# Write your MySQL query statement below
SELECT id,visit_date,people
FROM
(SELECT *,
CASE 
WHEN people >= 100 AND LEAD(people) OVER(ORDER BY id,visit_date) >= 100 AND LEAD(people,2) OVER(ORDER BY id,visit_date) >= 100 THEN 1
WHEN people >= 100 AND LAG(people) OVER(ORDER BY id,visit_date) >= 100 AND LEAD(people) OVER(ORDER BY id,visit_date) >= 100 THEN 1
WHEN people >= 100 AND LAG(people) OVER(ORDER BY id,visit_date) >= 100 AND LAG(people,2) OVER(ORDER BY id,visit_date) >= 100 THEN 1 END AS flag
FROM stadium) AS x
WHERE x.flag = 1;