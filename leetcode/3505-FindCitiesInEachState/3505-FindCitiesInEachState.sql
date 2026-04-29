-- Last updated: 29/04/2026, 23:01:26
# Write your MySQL query statement below
select
state,
group_concat(city order by city separator ', ') as cities
from
cities
group by 1
order by 1