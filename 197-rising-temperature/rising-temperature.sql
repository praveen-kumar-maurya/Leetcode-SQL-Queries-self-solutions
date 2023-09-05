WITH cte AS
(
  SELECT *
    ,LAG(temperature) OVER(ORDER BY recordDate ASC) as prev
    ,LAG(recordDate) OVER(ORDER BY recordDate ASC) as prev_date
    FROM weather
)

SELECT id
FROM cte
WHERE temperature > prev and DATEDIFF(recordDate,prev_date)= 1 ;