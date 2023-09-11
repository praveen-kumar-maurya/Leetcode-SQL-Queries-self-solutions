# Write your MySQL query statement below
WITH cte AS
(
SELECT *
, MAX(change_date) OVER(PARTITION BY product_id) AS max_change_date
FROM products
WHERE change_date <= "2019-08-16"
)

SELECT product_id, new_price AS price
FROM cte
WHERE max_change_date = change_date

UNION

SELECT p.product_id AS product_id, 10 AS price
FROM cte c
RIGHT JOIN products p
ON c.product_id = p.product_id
WHERE c.product_id IS NULL;