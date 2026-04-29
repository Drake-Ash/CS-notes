-- Last updated: 29/04/2026, 23:06:14
WITH cte_1 AS (
SELECT session_id,
(CASE WHEN duration<(300) AND duration>=0 THEN '[0-5>'
     WHEN duration >= (300) AND duration < (600) THEN '[5-10>'
     WHEN duration >= (600) AND duration < (900) THEN '[10-15>'
     ELSE '15 or more'
END) AS bin
FROM Sessions),

cte_2 AS(
SELECT '[0-5>' as bin
union
SELECT '[5-10>'
union
SELECT '[10-15>'
union
SELECT '15 or more')
       
SELECT cte_2.bin, COALESCE (COUNT(cte_1.session_id),0) AS total
FROM cte_2
LEFT JOIN cte_1 
ON cte_2.bin = cte_1.bin
GROUP BY cte_2.bin