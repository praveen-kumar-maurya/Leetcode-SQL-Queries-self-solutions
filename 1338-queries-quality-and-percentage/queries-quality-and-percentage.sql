# Write your MySQL query statement below
/*
SELECT q.query_name, ROUND(AVG(q.rating/q.position),2) AS quality, COALESCE(ROUND(a.rating_count*100/COUNT(q.rating) ,2),0) AS poor_query_percentage
FROM queries AS q
LEFT JOIN
(SELECT query_name,COUNT(rating) AS rating_count FROM queries WHERE rating<3 GROUP BY query_name) AS a
ON q.query_name = a.query_name
GROUP BY q.query_name;
*/

# Simpler way
SELECT query_name, ROUND(AVG(rating/position),2) AS quality, COALESCE(ROUND(SUM(CASE WHEN rating<3 THEN 1 ELSE 0 END)*100/COUNT(*) ,2),0) AS poor_query_percentage
FROM queries
GROUP BY query_name;