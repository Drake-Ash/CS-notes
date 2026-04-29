-- Last updated: 29/04/2026, 23:01:15
# Write your MySQL query statement below
SELECT a.employee_id,COUNT(*) AS overlapping_shifts FROM EmployeeShifts a
JOIN EmployeeShifts b
ON a.employee_id=b.employee_id AND a.start_time<b.start_time AND a.end_time>b.start_time
GROUP BY a.employee_id
ORDER BY employee_id;