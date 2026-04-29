-- Last updated: 29/04/2026, 23:09:30
with A as (
select
case when followee in (select distinct follower from follow) then followee end as follower
from
follow
)


select
follower,
count(follower) as num
from
A
where follower is not null
group by 1
order by 1