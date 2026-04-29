-- Last updated: 29/04/2026, 23:07:11
# Write your MySQL query statement below
WITH tmp AS (
SELECT
    first_player AS player_id,
    first_score AS score
FROM Matches

UNION ALL

SELECT
    second_player AS player_id,
    second_score AS score
FROM Matches
),

tmp2 AS (
    SELECT
        group_id,
        player_id,
        SUM(score) AS total_score
    FROM tmp
    LEFT JOIN Players USING (player_id)
    GROUP BY player_id
)


SELECT 
    group_id,
    player_id
FROM (
    SELECT
    *,
    RANK() OVER (PARTITION BY group_id ORDER BY total_score DESC, player_id ASC) AS rnk
FROM tmp2
) t
WHERE rnk = 1