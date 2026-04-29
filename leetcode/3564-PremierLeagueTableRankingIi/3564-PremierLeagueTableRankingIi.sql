-- Last updated: 29/04/2026, 23:01:17
# Write your MySQL query statement below
with cte as (select count(*) as num_teams
from TeamStats)

select team_name, points, position, 
case when position < ((0.33 * num_teams)+1) then 'Tier 1'
     when position < ((0.66 * num_teams)+1) then 'Tier 2'
     else 'Tier 3' 
end as Tier
from 
(select team_name, points, rank() over(order by points desc) as position 
from 
(select team_name, 
sum(wins * 3 + draws * 1 + losses * 0) as points 
from TeamStats
group by 1) temp) temp, cte
order by 2 desc, 1