# Write your MySQL query statement below
SELECT class
FROM
(SELECT class, COUNT(*) AS count
FROM courses
GROUP BY class
) AS x
WHERE x.count >= 5
