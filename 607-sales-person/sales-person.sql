# Write your MySQL query statement below
/*
SELECT DISTINCT s.name
FROM salesperson s
LEFT JOIN orders o
ON s.sales_id = o.sales_id
INNER JOIN company c
ON c.com_id = o.com_id
WHERE c.name != 'RED' OR o.amount IS NULL;
*/

SELECT name
FROM salesperson
WHERE name NOT IN (SELECT DISTINCT(s.name) FROM salesperson s INNER JOIN orders o ON s.sales_id = o.sales_id INNER JOIN company c ON c.com_id = o.com_id WHERE c.name = 'RED')