# Write your MySQL query statement below
SELECT u.product_id, ROUND((SUM(p.price * u.units)/SUM(u.units)),2) AS average_price
FROM prices p
INNER JOIN unitssold u
ON p.product_id = u.product_id 
WHERE u.purchase_date >= p.start_date and u.purchase_date <= p.end_date
GROUP BY u.product_id;