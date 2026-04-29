-- Last updated: 29/04/2026, 23:01:14
select
team_id,
team_name,
(wins * 3 + draws) as points,
rank() over (order by (wins * 3 + draws) desc) as position
from
teamstats
order by 3 desc,2
