-- Last updated: 29/04/2026, 23:03:53
# Write your MySQL query statement below
SELECT COUNT(DISTINCT customer_id) AS rich_count
FROM Store
WHERE amount > 500