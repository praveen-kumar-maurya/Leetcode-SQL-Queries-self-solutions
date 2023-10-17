# Write your MySQL query statement below
SELECT u.name AS name, SUM(t.amount) AS balance
FROM users u
INNER JOIN transactions t
ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;