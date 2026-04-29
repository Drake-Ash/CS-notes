-- Last updated: 29/04/2026, 23:02:30
with A as (
select
user_id,
steps_date,
lag(steps_date,1,steps_date) over (partition by user_id order by steps_date) as day_before,
lag(steps_date,2,steps_date) over (partition by user_id order by steps_date) as day_after,
steps_count,
lag(steps_count,1,steps_count) over (partition by user_id order by steps_date) as steps_before,
lag(steps_count,2,steps_count) over (partition by user_id order by steps_date) as steps_after
from
steps
)

select
user_id,
steps_date,
round((steps_count + steps_before + steps_after) * 1.0/3,2) as rolling_average
from
A
where 
steps_date = day_before + 1 
and 
day_after + 1 = day_before 