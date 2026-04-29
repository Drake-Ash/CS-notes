-- Last updated: 29/04/2026, 23:07:49
select player_id, device_id 
from activity 
where (player_id, event_date) in (
                                select player_id, min(event_date)
                                from activity 
                                group by player_id
                                 ) 