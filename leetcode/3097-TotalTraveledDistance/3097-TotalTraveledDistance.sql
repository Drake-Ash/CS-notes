-- Last updated: 29/04/2026, 23:02:34
select
u.user_id,
u.name,
coalesce(sum(r.distance),0) as "traveled distance"
from
users u
left join
rides r
on u.user_id = r.user_id
group by 1,2
order by 1