-- Last updated: 29/04/2026, 23:04:04
WITH seniors AS 
(
    SELECT
        *,
        SUM(salary) OVER (ORDER BY salary) AS cum_sum
    FROM
        candidates
    WHERE
        experience = 'Senior'
),

juniors AS 
(
    SELECT
        *,
        SUM(salary) OVER (ORDER BY salary) AS cum_sum
    FROM
        candidates
    WHERE
        experience = 'Junior'
),

shire AS (
    SELECT employee_id
    FROM seniors
    WHERE cum_sum <= 70000
),

remaining_budget AS (
    SELECT 70000 - IFNULL(MAX(cum_sum), 0) AS budget_left
    FROM seniors
    WHERE cum_sum <= 70000
),

hired_juniors AS (
    SELECT employee_id
    FROM juniors
    WHERE cum_sum <= (SELECT budget_left FROM remaining_budget)
)

SELECT
    employee_id
FROM
    shire
UNION
SELECT
    employee_id
FROM
    hired_juniors;