-- Last updated: 29/04/2026, 23:04:43
SELECT DISTINCT p.session_id
FROM playback p
LEFT JOIN ads a
ON p.customer_id = a.customer_id
   AND a.timestamp >= p.start_time
   AND a.timestamp <= p.end_time
WHERE a.customer_id IS NULL;
