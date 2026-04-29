-- Last updated: 29/04/2026, 23:05:01
# Write your MySQL query statement below
select
event_day as day,
emp_id,
sum(out_time - in_time) as total_time
from
employees
group by 1,2