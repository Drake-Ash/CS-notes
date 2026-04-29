-- Last updated: 29/04/2026, 23:07:50
select player_id,min(event_date) as first_login
from Activity
group by player_id; 