# Write your MySQL query statement below
WITH cte AS
(
SELECT *
, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) as rn
FROM sales s
)

SELECT c.product_id AS product_id, c.year AS first_year, c.quantity AS quantity,c.price AS price
FROM cte c
INNER JOIN product p
ON c.product_id = p.product_id
WHERE c.rn = 1;