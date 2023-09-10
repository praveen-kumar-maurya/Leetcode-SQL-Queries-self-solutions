# Write your MySQL query statement below
/*
SELECT MAX(num) AS num
FROM
( 
SELECT num
FROM
(SELECT num, COUNT(*) as count
FROM mynumbers
GROUP BY num
) AS x
WHERE x.count =1
) AS b
*/

# Better way
SELECT ifnull(
(SELECT num
FROM mynumbers
GROUP BY num
HAVING COUNT(*) = 1
ORDER BY num DESC
LIMIT 1),null) AS num