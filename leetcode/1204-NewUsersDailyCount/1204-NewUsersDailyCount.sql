-- Last updated: 29/04/2026, 23:07:40
with c1 as
(
select user_id, min(activity_date) as user_activity
from traffic
where activity like "login"
group by user_id
having user_activity between "2019-04-01" and "2019-06-30"
)

select c1.user_activity as login_date, count(c1.user_id) as user_count
from c1
group by c1.user_activity