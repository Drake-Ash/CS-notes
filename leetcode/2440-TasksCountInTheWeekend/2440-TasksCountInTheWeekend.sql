-- Last updated: 29/04/2026, 23:03:24
# Write your MySQL query statement below
select
sum(case when DAYOFWEEK(submit_date) in (1,7) then 1 else 0 end) as weekend_cnt,
sum(case when DAYOFWEEK(submit_date) not in (1,7) then 1 else 0 end) as working_cnt
from
tasks