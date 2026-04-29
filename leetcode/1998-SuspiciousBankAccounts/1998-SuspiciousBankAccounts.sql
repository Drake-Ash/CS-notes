-- Last updated: 29/04/2026, 23:04:36
WITH A AS (
    SELECT
        t.account_id,
        a.max_income,
        EXTRACT(YEAR_MONTH FROM t.day) AS month,
        SUM(t.amount) AS monthly_income
    FROM
        transactions t
    JOIN
        accounts a ON t.account_id = a.account_id
    WHERE
        t.type = 'Creditor'
    GROUP BY
        t.account_id, EXTRACT(YEAR_MONTH FROM t.day)
),
B AS (
    SELECT
        A.account_id,
        A.month,
        A.monthly_income,
        A.max_income,
        LAG(A.month) OVER (PARTITION BY A.account_id ORDER BY A.month) AS prev_month,
        LAG(A.monthly_income) OVER (PARTITION BY A.account_id ORDER BY A.month) AS prev_income
    FROM
        A
),
C AS (
    SELECT
        B.account_id,
        COUNT(*) AS consecutive_months
    FROM
        B
    WHERE
        B.monthly_income > B.max_income
        AND B.prev_income > B.max_income
        AND B.month = B.prev_month + 1
    GROUP BY
        B.account_id
)
SELECT DISTINCT
    C.account_id
FROM
    C
WHERE
    C.consecutive_months >= 1;