# Write your MySQL query statement below
SELECT r.contest_id AS contest_id, ROUND((COUNT(r.user_id)/users_count)*100,2) AS percentage
FROM 
(
  SELECT *,COUNT(user_id) OVER(RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS users_count 
  FROM users 
) AS u
INNER JOIN register r
using(user_id)
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;