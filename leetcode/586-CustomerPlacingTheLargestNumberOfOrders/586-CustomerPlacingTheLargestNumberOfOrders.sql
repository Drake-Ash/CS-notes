-- Last updated: 29/04/2026, 23:09:48
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY count(*) DESC LIMIT 1