# Write your MySQL query statement below
/*
WITH cte AS
(
SELECT *,COUNT(DISTINCT product_key) as count_products
FROM customer
GROUP BY customer_id
)

SELECT x.customer_id as customer_id
FROM
(
SELECT c.customer_id AS customer_id,
CASE WHEN c.count_products = (SELECT COUNT(product_key) FROM product) THEN 1 ELSE 0 END AS flag
FROM cte c
INNER JOIN product p
ON c.product_key = p.product_key
) AS x
WHERE x.flag = 1;
*/

SELECT customer_id
FROM customer c
INNER JOIN product p
ON c.product_key = p.product_key
GROUP BY customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(product_key) FROM product )


/*
SELECT customer_id
FROM 
(SELECT customer_id,COUNT(DISTINCT c.product_key) AS count
FROM customer c
INNER JOIN product p
ON c.product_key = p.product_key
GROUP BY customer_id
) AS x
WHERE x.count = (SELECT COUNT(product_key) FROM product )
*/