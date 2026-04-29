-- Last updated: 29/04/2026, 23:05:07
with A as (
select
user_id,
visit_date
from 
uservisits
union
select
user_id,
'2021-1-1' as visit_date
from
uservisits)


select user_id,max(biggest_window) as biggest_window
from
(
select user_id,
datediff(lead(visit_date,1,visit_date) over (partition by user_id order by visit_date),
visit_date) as biggest_window 
from A) B
group by 1