-- Last updated: 29/04/2026, 23:04:29
Select user_id, max(time_stamp) as last_stamp 
From Logins 
Where year(time_stamp) = 2020
Group By user_id;