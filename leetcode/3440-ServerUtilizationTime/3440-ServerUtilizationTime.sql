-- Last updated: 29/04/2026, 23:01:38
# Write your MySQL query statement below
WITH ServersDuration AS (
    SELECT s1.server_id, s1.status_time AS 'start_time', MIN(s2.status_time) AS 'end_time', TIME_TO_SEC(TIMEDIFF(MIN(s2.status_time), s1.status_time)) AS 'duration'
    FROM Servers s1, Servers s2
    WHERE s1.server_id = s2.server_id AND s1.status_time < s2.status_time
    AND s2.session_status = 'stop' AND s1.session_status = 'start'  
    GROUP BY s1.server_id, s1.status_time
)

SELECT FLOOR(SUM(duration) / (60*60*24)) AS 'total_uptime_days'
FROM ServersDuration
