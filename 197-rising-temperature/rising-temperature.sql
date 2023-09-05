# Write your MySQL query statement below
/*
SELECT X.id 
FROM WEATHER X,WEATHER Y 
WHERE DATEDIFF(X.recordDate,Y.recordDate) = 1 AND X.temperature > Y.temperature;
*/

/* 12 out of 14 cases are only working, don't know why */
/*
WITH CTE AS
(
    SELECT id, DATE_FORMAT(recordDate, '%y-%m-%d') AS recordDate, temperature 
    FROM Weather 
),

t1 AS
(
    SELECT *
    ,LAG(temperature) OVER(ORDER BY recordDate ASC) as prev
    FROM CTE
)

SELECT id
FROM t1
WHERE temperature - prev > 0
*/
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



