# Write your MySQL query statement below
SELECT *
FROM users
WHERE REGEXP_LIKE(mail,'^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com')