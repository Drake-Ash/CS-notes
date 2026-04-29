-- Last updated: 29/04/2026, 23:03:41
select
tp.team_id,
tp.name,
dense_rank() over (order by tp.points desc,name) - dense_rank() over (order by tp.points + pc.points_change desc,name) as rank_diff
from
teampoints tp
join
pointschange pc
on tp.team_id = pc.team_id