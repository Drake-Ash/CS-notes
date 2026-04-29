-- Last updated: 29/04/2026, 23:03:03
WITH CTE AS (
    SELECT E.employee_id,
        IFNULL(SUM(CEILING(TIMESTAMPDIFF(SECOND, L.in_time, L.out_time) / 60)), 0) AS duration_in_minutes,
        E.needed_hours * 60 AS needed_minutes
    FROM Employees E
    LEFT JOIN Logs L
    ON E.employee_id = L.employee_id
    GROUP BY E.employee_id
)
SELECT employee_id
FROM CTE
WHERE duration_in_minutes < needed_minutes