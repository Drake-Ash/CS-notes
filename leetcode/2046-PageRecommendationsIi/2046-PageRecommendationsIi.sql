-- Last updated: 29/04/2026, 23:04:28
WITH friendsv2 AS (
    SELECT user1_id AS user_id, user2_id AS friend_id FROM friendship
    UNION ALL
    SELECT user2_id AS user_id, user1_id AS friend_id FROM friendship
),
friend_likes AS (
    SELECT 
        f.user_id, 
        l.page_id 
    FROM 
        friendsv2 f
    JOIN 
        likes l 
    ON 
        f.friend_id = l.user_id
),
user_likes AS (
    SELECT 
        user_id, 
        page_id 
    FROM 
        likes
),
recommendations AS (
    SELECT 
        fl.user_id, 
        fl.page_id, 
        COUNT(*) AS friends_likes
    FROM 
        friend_likes fl
    LEFT JOIN 
        user_likes ul 
    ON 
        fl.user_id = ul.user_id 
        AND fl.page_id = ul.page_id
    WHERE 
        ul.page_id IS NULL
    GROUP BY 
        fl.user_id, fl.page_id
)
SELECT 
    user_id, 
    page_id, 
    friends_likes
FROM 
    recommendations
ORDER BY 
    user_id, page_id;