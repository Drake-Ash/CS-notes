-- Last updated: 29/04/2026, 23:04:24
WITH USERS_LISTEN_THE_SAME_SONGS_ON_SAME_DATE AS (
    SELECT L1.user_id AS user_id,
        L1.song_id,
        L1.day,
        L2.user_id AS recommended_id
    FROM Listens L1
    INNER JOIN Listens L2
    ON L1.song_id = L2.song_id
    AND L1.day = L2.day
    AND L1.user_id < L2.user_id
    GROUP BY L1.day, user_id, recommended_id
    HAVING COUNT(DISTINCT L1.song_id) >= 3
),
HALF AS (
    SELECT DISTINCT user_id,
           recommended_id
    FROM USERS_LISTEN_THE_SAME_SONGS_ON_SAME_DATE
    WHERE (user_id, recommended_id) NOT IN (
            SELECT user1_id, user2_id
            FROM Friendship
    )
)
SELECT user_id,
       recommended_id 
FROM HALF
UNION ALL
SELECT recommended_id,
       user_id 
FROM HALF