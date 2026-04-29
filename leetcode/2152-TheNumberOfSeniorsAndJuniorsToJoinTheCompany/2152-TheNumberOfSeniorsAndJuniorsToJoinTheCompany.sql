-- Last updated: 29/04/2026, 23:04:05
WITH SENIORS AS (
    SELECT employee_id,
        experience,
        salary,
        SUM(salary) OVER(ORDER BY salary ASC, employee_id ASC) AS acc_salary
    FROM Candidates
    WHERE experience = 'Senior'
),
JUNIORS AS (
    SELECT employee_id,
        experience,
        salary,
        SUM(salary) OVER(ORDER BY salary ASC, employee_id ASC) AS acc_salary
    FROM Candidates
    WHERE experience = 'Junior'
)

SELECT 'Senior' AS experience,
       COUNT(employee_id) AS accepted_candidates
FROM SENIORS
WHERE acc_salary <= 70000
UNION ALL
SELECT 'Junior' AS experience,
       COUNT(employee_id) AS accepted_candidates
FROM JUNIORS
WHERE acc_salary <= 70000 - (
    SELECT IFNULL(MAX(acc_salary), 0)
    FROM SENIORS
    WHERE acc_salary <= 70000
    )