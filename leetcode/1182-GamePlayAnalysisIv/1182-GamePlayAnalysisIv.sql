-- Last updated: 29/04/2026, 23:07:46
WITH FirstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        activity
    GROUP BY
        player_id
),
NextDayLogin AS (
    SELECT
        fl.player_id
    FROM
        FirstLogin fl
    JOIN
        activity a
    ON
        fl.player_id = a.player_id
        AND a.event_date = fl.first_login_date + INTERVAL '1 day'
)
SELECT
    ROUND(COUNT(DISTINCT ndl.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM activity), 2) AS fraction
FROM
    NextDayLogin ndl;