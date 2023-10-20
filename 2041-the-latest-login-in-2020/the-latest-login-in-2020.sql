# Write your MySQL query statement below
# Better solution
/*
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE YEAR(time_stamp) = 2020
GROUP BY user_id
*/

# Alternate method
SELECT DISTINCT user_id,
FIRST_VALUE(time_stamp) OVER(PARTITION BY user_id ORDER BY time_stamp DESC) AS last_stamp
FROM logins
WHERE YEAR(time_stamp) = 2020