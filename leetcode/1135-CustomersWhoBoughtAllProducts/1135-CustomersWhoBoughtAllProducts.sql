-- Last updated: 29/04/2026, 23:08:12
# Write your MySQL query statement below
SELECT  customer_id 
FROM Customer 
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)