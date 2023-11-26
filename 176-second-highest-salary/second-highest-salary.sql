# Write your MySQL query statement below
WITH cte AS
(
SELECT *
, DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
FROM employee
)
/*
SELECT IFNULL(
(SELECT salary 
FROM cte
WHERE rn = 2 
LIMIT 1), NULL) AS secondhighestsalary ;
*/
/* Even COALESCE can also be used instead of IFNULL*/
SELECT COALESCE(
(SELECT salary  
FROM cte
WHERE rn = 2 
LIMIT 1),NULL) AS SecondHighestSalary
