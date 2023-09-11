# Write your MySQL query statement below
SELECT ConsecutiveNums AS "ConsecutiveNums"
FROM
( 
SELECT DISTINCT(CASE WHEN num = LEAD(num) OVER() 
and num = LEAD(num,2) OVER() THEN num END) AS ConsecutiveNums
FROM logs
) AS x
WHERE x.ConsecutiveNums IS NOT NULL;