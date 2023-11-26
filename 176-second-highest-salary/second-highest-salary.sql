# Write your MySQL query statement below
SELECT 
    (SELECT DISTINCT salary 
     FROM Employee 
     ORDER BY salary DESC 
     LIMIT 1 OFFSET 1) AS SecondHighestSalary;

/*
WITH cte AS
(
SELECT *
, DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
FROM employee
)

SELECT IFNULL(
(SELECT salary 
FROM cte
WHERE rn = 2 
LIMIT 1), NULL) AS SecondHighestSalary ;
*/

/* Even COALESCE can also be used instead of IFNULL*/
/*
SELECT COALESCE(
(SELECT salary  
FROM cte
WHERE rn = 2 
LIMIT 1), NULL) AS SecondHighestSalary;
*/
