-- Last updated: 29/04/2026, 23:03:02
WITH RECURSIVE A AS (
    SELECT
        customer_id,
        price,
        YEAR(order_date) AS year,
        MAX(YEAR(order_date)) OVER (PARTITION BY customer_id) AS last_year
    FROM
        orders
    UNION ALL
    SELECT 
        customer_id, 
        0 AS price, 
        year + 1, 
        last_year
    FROM
        A
    WHERE 
        year < last_year
),
B AS (
    SELECT 
        customer_id,
        year,
        SUM(price) AS total
    FROM 
        A
    GROUP BY 
        customer_id, year
),
C AS (
    SELECT 
        b1.customer_id,
        SUM(CASE WHEN b2.total > b1.total THEN 1 ELSE 0 END) AS increasing_years,
        COUNT(*) AS total_years
    FROM 
        B b1
    LEFT JOIN 
        B b2 
    ON 
        b1.customer_id = b2.customer_id
        AND b1.year + 1 = b2.year
    GROUP BY 
        b1.customer_id
)
SELECT 
    customer_id
FROM 
    C
WHERE 
    increasing_years = total_years - 1