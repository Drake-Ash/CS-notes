-- Last updated: 29/04/2026, 23:06:40
# Write your MySQL query statement below
select
gender,
day,
sum(score_points) over (partition by gender order by day) as total
from
scores