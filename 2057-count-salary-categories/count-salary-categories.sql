# Write your MySQL query statement below

SELECT 'Low Salary' AS category, SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts

UNION

SELECT 'Average Salary' AS category, SUM(CASE WHEN income <=50000 and income>= 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts

UNION

SELECT 'High Salary' AS category, SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts