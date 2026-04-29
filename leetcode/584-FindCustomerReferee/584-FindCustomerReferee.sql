-- Last updated: 29/04/2026, 23:09:52
SELECT name
FROM Customer
WHERE COALESCE(referee_id,0) <> 2;