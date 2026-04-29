-- Last updated: 29/04/2026, 23:07:04
with A as (
select
host_team,
case when host_goals > guest_goals then 3 when host_goals = guest_goals then 1 else 0 end as num_points
from
matches
union all
select
guest_team,
case when guest_goals > host_goals then 3 when host_goals = guest_goals then 1 else 0 end as num_points
from
matches
)

select
t.team_id as team_id,
t.team_name,
ifnull(sum(A.num_points),0) as num_points
from
A
right join
teams t
on A.host_team = t.team_id
group by 1,2
order by 3 desc,1