-- Last updated: 29/04/2026, 23:07:59
# Write your MySQL query statement below
WITH count_ AS (
    SELECT project_id, COUNT(DISTINCT employee_id) AS num_emp
    FROM project
    GROUP BY project_id
)
SELECT project_id
FROM count_
WHERE num_emp = (SELECT MAX(num_emp) FROM count_);
