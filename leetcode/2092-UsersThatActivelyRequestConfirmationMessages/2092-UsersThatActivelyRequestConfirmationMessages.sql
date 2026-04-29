-- Last updated: 29/04/2026, 23:04:20
SELECT 
distinct a.user_id 
FROM Confirmations a, Confirmations b
WHERE a.user_id = b.user_id 
and b.time_stamp - a.time_stamp <= 1000000 
and b.time_stamp > a.time_stamp 