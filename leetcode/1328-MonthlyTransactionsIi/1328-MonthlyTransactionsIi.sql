-- Last updated: 29/04/2026, 23:07:07
# Write your MySQL query statement below
WITH cte AS(
    SELECT
        country,
        amount,
        DATE_FORMAT(c.trans_date, '%Y-%m') AS trans_date,
        'charge back' AS type
    FROM Chargebacks c LEFT JOIN Transactions t
        ON c.trans_id = t.id
    UNION ALL
    SELECT
        country,
        amount,
        DATE_FORMAT(trans_date, '%Y-%m') AS trans_date,
        'transaction' AS type
    FROM Transactions
    WHERE state = 'approved')

SELECT 
    trans_date AS 'month',
    country,
    SUM(IF(type = 'transaction', 1, 0)) AS approved_count,
    SUM(IF(type = 'transaction', amount, 0)) AS approved_amount,
    SUM(IF(type = 'charge back', 1, 0)) AS chargeback_count,
    SUM(IF(type = 'charge back', amount, 0)) AS chargeback_amount
FROM cte
GROUP BY country, trans_date