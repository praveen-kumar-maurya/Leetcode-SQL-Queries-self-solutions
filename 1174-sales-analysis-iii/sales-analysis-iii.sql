# Write your MySQL query statement below
SELECT DISTINCT p.product_id AS product_id, p.product_name AS product_name
FROM product p
INNER JOIN sales s
ON p.product_id = s.product_id
WHERE (s.sale_date BETWEEN '2019-01-01' AND '2019-03-31') AND p.product_id NOT IN (SELECT DISTINCT p.product_id AS product_id
FROM product p
INNER JOIN sales s
ON p.product_id = s.product_id
WHERE (s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'));