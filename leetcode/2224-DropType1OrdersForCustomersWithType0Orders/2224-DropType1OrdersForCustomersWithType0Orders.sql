-- Last updated: 29/04/2026, 23:03:52
SELECT * FROM Orders
WHERE (customer_id, order_type) 
IN (SELECT customer_id, MIN(order_type) 
    FROM Orders 
    GROUP BY customer_id)