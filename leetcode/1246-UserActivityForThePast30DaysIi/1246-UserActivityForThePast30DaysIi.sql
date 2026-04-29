-- Last updated: 29/04/2026, 23:07:28
SELECT
IFNULL(ROUND((COUNT(DISTINCT CONCAT(user_id,session_id ))/COUNT(DISTINCT user_id)),2),0) AS average_sessions_per_user
FROM Activity
WHERE DATEDIFF('2019-07-27',activity_date) < 30