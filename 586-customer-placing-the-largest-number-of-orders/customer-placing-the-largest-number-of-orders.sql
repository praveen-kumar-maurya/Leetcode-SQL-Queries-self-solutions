
SELECT customer_number
FROM orders
GROUP BY customer_number
HAVING COUNT(order_number) = (SELECT MAX(x.count) FROM (SELECT COUNT(order_number) AS count FROM orders GROUP BY customer_number) AS x)


/* Alternate solution but a bit doubtful 
WITH CTE AS
(
SELECT *
,COUNT(order_number) OVER(PARTITION BY customer_number) AS count
FROM Orders 
)

SELECT DISTINCT(customer_number)
FROM CTE 
WHERE count = (SELECT MAX(count) FROM CTE )
*/