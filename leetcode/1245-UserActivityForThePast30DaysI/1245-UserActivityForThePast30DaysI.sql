-- Last updated: 29/04/2026, 23:07:29
select activity_date as day, 
count(*) as active_users 
from (
    select distinct user_id,activity_date 
    from activity 
    where activity_date<='2019-07-27' and activity_date>'2019-06-27') as a 
group by activity_date order by activity_date