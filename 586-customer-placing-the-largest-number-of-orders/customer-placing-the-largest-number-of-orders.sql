
SELECT customer_number
FROM orders
GROUP BY customer_number
HAVING COUNT(order_number) = (SELECT MAX(x.count) FROM (SELECT COUNT(order_number) AS count FROM orders GROUP BY customer_number) AS x)
