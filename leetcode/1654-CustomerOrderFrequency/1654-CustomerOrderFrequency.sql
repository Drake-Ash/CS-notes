-- Last updated: 29/04/2026, 23:05:51
SELECT customer_id, name 
FROM Customers C JOIN Orders
USING(customer_id)
JOIN Product
USING(product_id)
GROUP BY C.customer_id
HAVING SUM(IF(order_date LIKE '2020-06%', quantity * price,0)) >= 100
AND SUM(IF(order_date LIKE '2020-07%', quantity * price,0)) >=100;