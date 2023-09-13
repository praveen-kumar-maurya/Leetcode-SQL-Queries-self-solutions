# Write your MySQL query statement below
WITH cte AS
(
SELECT *
, ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
FROM person
)

DELETE FROM person
WHERE id IN (SELECT id
FROM cte 
WHERE rn > 1)
