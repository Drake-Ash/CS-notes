-- Last updated: 29/04/2026, 23:03:12
WITH cte AS (
    SELECT
        student_id
        , department_id
        , RANK() OVER(PARTITION BY department_id ORDER BY mark DESC) rnk
        , COUNT(student_id) OVER(PARTITION BY department_id) num_students
    FROM Students
)
SELECT
    student_id
    , department_id
    , IFNULL(ROUND(((rnk - 1) * 100) / (num_students - 1), 2), 0) percentage
FROM cte;