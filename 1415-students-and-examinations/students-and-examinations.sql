# Write your MySQL query statement below
SELECT s.student_id,s.student_name,sub.subject_name, COALESCE(e.attended_exams,0) AS attended_exams
FROM students s
CROSS JOIN subjects sub
LEFT JOIN 
(
  SELECT student_id, subject_name, COUNT(*) as attended_exams
  FROM examinations
  GROUP BY 1,2
) e
ON s.student_id = e.student_id and sub.subject_name = e.subject_name
GROUP BY s.student_id,s.student_name,sub.subject_name
ORDER BY s.student_id, sub.subject_name;
