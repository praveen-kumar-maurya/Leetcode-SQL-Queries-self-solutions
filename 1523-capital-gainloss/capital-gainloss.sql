# Write your MySQL query statement below
/*
WITH cte AS
(
SELECT*
, CASE WHEN operation = 'Buy' Then price*(-1) ELSE price END AS action
FROM stocks
)

SELECT stock_name
, SUM(action) AS capital_gain_loss
FROM cte
GROUP BY stock_name
*/

# Alternate method

SELECT stock_name
, SUM(CASE WHEN operation = 'Buy' Then price*(-1) ELSE price END) AS capital_gain_loss
FROM stocks
GROUP BY stock_name