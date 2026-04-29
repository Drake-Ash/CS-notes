-- Last updated: 29/04/2026, 23:01:32

WITH CTE AS(
SELECT
    car_id,
    SUM(fee_paid) AS total_fee_paid,
    ROUND(SUM(fee_paid)/SUM(TIMESTAMPDIFF(MINUTE, entry_time, exit_time)/60),2) AS avg_hourly_fee
FROM
    ParkingTransactions
GROUP BY car_id
ORDER BY car_id
),

CTE2 AS(
    SELECT
        lot_id,
        car_id,
        RANK() OVER(Partition by car_id 
                    Order by SUM(TIMESTAMPDIFF(MINUTE, entry_time, exit_time)) DESC) AS rk
    FROM 
        ParkingTransactions
    GROUP BY car_id, lot_id
)

SELECT
    c1.car_id,
    c1.total_fee_paid,
    c1.avg_hourly_fee,
    c2.lot_id AS most_time_lot
FROM
    cte c1
LEFT JOIN
    cte2 c2
ON
    c1.car_id = c2.car_id
WHERE rk = 1