# Write your MySQL query statement below
WITH cte_1 AS
(
  SELECT *
  ,ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY product_id,start_date) AS row_1
  FROM prices 
),

cte_2 AS
(
  SELECT *
  ,ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY product_id, purchase_date) AS row_2
  FROM unitssold 
)

SELECT c2.product_id, ROUND((SUM(c1.price * c2.units)/SUM(c2.units)),2) AS average_price
FROM cte_1 c1
INNER JOIN cte_2 c2
ON c1.product_id = c2.product_id #and c1.row_1 = c2.row_2
WHERE c2.purchase_date >= c1.start_date and c2.purchase_date <= c1.end_date
GROUP BY c2.product_id;