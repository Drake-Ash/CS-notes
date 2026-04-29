-- Last updated: 29/04/2026, 23:07:55
SELECT seller_id from Sales
GROUP BY seller_id
HAVING SUM(price)=(select SUM(price) OVER(PARTITION BY seller_id)
from Sales ORDER BY 1 DESC LIMIT 1)