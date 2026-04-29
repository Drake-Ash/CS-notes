-- Last updated: 29/04/2026, 23:06:38
-- Write your PostgreSQL query statement below
SELECT
    visited_on, 
    ROUND(sum(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS amount,
    ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM (select visited_on, sum(amount) as amount from customer group by visited_on ) as a
order by visited_on
OFFSET 6 ROWS