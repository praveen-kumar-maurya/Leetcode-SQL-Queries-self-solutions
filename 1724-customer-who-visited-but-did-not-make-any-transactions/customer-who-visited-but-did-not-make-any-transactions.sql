# Write your MySQL query statement below
SELECT customer_id, COUNT(v.visit_id) AS count_no_trans
FROM visits as v
LEFT JOIN transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY customer_id;