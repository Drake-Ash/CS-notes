-- Last updated: 29/04/2026, 23:04:13
WITH ALL_CALLS AS (
    SELECT caller_id AS user1_id,
           recipient_id AS user2_id,
           call_time
    FROM Calls
    UNION ALL
    SELECT recipient_id AS user1_id,
           caller_id AS user2_id,
           call_time
    FROM Calls
),
FIRST_AND_LAST_CALLS AS (
    SELECT *,
        FIRST_VALUE(user2_id) OVER(PARTITION BY user1_id, DATE(call_time) ORDER BY call_time ASC) AS first_call,
        FIRST_VALUE(user2_id) OVER(PARTITION BY user1_id, DATE(call_time) ORDER BY call_time DESC) AS last_call
    FROM ALL_CALLS
)
SELECT DISTINCT user1_id AS user_id
FROM FIRST_AND_LAST_CALLS
WHERE first_call = last_call