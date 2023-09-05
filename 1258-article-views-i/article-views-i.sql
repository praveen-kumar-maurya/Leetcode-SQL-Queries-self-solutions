# Write your MySQL query statement below
SELECT DISTINCT(v1.author_id) AS id
FROM views v1
join views v2
ON v1.article_id = v2.article_id AND v1.author_id = v2.viewer_id
ORDER BY id;