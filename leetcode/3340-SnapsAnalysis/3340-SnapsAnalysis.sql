-- Last updated: 29/04/2026, 23:01:55
# Write your MySQL query statement below
with t1 as (select age_bucket, activity_type, sum(time_spent) as time_spent
from Activities a
join Age b
on a.user_id = b.user_id
group by 1,2),

t2 as (select age_bucket, activity_type, round(time_spent/sum(time_spent) over (partition by age_bucket)*100,2) as perc
from t1)

select age_bucket,
sum(case when activity_type = 'send' then perc else 0 end) as send_perc,
sum(case when activity_type = 'open' then perc else 0 end) as open_perc
from t2
group by 1