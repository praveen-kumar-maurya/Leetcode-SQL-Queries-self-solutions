# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM products p
INNER JOIN orders o
ON p.product_id = o.product_id
WHERE DATE_FORMAT(order_date, '%Y-%m') = "2020-02"
GROUP BY product_name
HAVING SUM(unit) >= 100;