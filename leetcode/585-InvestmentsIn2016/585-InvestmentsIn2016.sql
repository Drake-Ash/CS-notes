-- Last updated: 29/04/2026, 23:09:50
WITH cte AS (
    SELECT CONCAT(lat, ',', lon) AS location
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(pid) > 1
),
cte2 AS (
    SELECT DISTINCT I1.*
    FROM Insurance I1
    LEFT JOIN Insurance I2 ON I1.tiv_2015 = I2.tiv_2015
    WHERE I1.pid <> I2.pid
    AND CONCAT(I1.lat, ',', I1.lon) NOT IN (SELECT location FROM cte)
)
SELECT round(SUM(tiv_2016), 2) AS tiv_2016
FROM cte2