-- Last updated: 29/04/2026, 23:05:08
# Write your MySQL query statement below
with A as (
select
case when from_id < to_id then from_id else to_id end as person1,
case when from_id > to_id then from_id else to_id end as person2,
duration
from
calls)

select
person1,
person2,
count(*) as call_count,
sum(duration) as total_duration
from
A
group by 1,2