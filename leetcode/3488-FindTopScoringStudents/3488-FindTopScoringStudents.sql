-- Last updated: 29/04/2026, 23:01:29
SELECT s.student_id
FROM students s
JOIN courses c
USING(major)
LEFT JOIN enrollments e
ON s.student_id = e.student_id AND c.course_id = e.course_id AND e.grade = 'A'
GROUP BY 1
HAVING COUNT(c.course_id) = SUM(e.grade = 'A') 
ORDER BY 1