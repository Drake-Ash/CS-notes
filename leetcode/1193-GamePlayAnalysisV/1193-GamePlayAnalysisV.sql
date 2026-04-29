-- Last updated: 29/04/2026, 23:07:45
with cte as (
select
player_id,min(event_date) as first_login
from
activity
group by 1)

select
c.first_login as install_dt,
sum(case when c.first_login = a.event_date then 1 else 0 end) as installs,
round(sum(case when c.first_login + 1 = a.event_date then 1 else 0 end) * 1.0 / sum(case when c.first_login = a.event_date then 1 else 0 end),2) as Day1_retention
from
activity a
join
cte c
on a.player_id = c.player_id
group by 1