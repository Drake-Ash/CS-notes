-- Last updated: 29/04/2026, 23:05:42
# Write your MySQL query statement below
SELECT 
    product_name,
    product_id,
    order_id,
    order_date 
FROM (
    SELECT 
        *,
        DENSE_RANK() OVER (PARTITION BY p.product_id ORDER BY o.order_date DESC) AS rnk
    FROM Products p
    JOIN Orders o
    USING(product_id)
) AS t
WHERE rnk = 1
ORDER BY product_name, product_id, order_id;