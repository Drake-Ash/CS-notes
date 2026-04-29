-- Last updated: 29/04/2026, 23:05:24
# Write your MySQL query STATEMENT below
WITH recursive cte(n)
AS
  (
         SELECT 1 AS month
         UNION ALL
         SELECT n+1
         FROM   cte
         WHERE  n<12 ),
  cte1
AS
  (
            SELECT    count(r.ride_id)    AS accepted_rides,
                      month(requested_at) AS requested_at
            FROM      rides r
            LEFT JOIN acceptedrides a
            ON        r.ride_id = a.ride_id
            WHERE     year(requested_at) = 2020
            AND       driver_id IS NOT NULL
            GROUP BY  month(requested_at)),
  cte2
AS
  (
           SELECT
                    CASE
                             WHEN year(join_date) <2020 THEN 1
                             ELSE month(join_date)
                    end AS island,
                    driver_id
           FROM     drivers
           WHERE    year(join_date)<=2020
           ORDER BY island)
  SELECT    cte.n                    AS month,
            count(island)            AS active_drivers,
            ifnull(accepted_rides,0) AS accepted_rides
  FROM      cte
  LEFT JOIN cte2
  ON        n >= island
  LEFT JOIN cte1
  ON        requested_at = n
  GROUP BY  n