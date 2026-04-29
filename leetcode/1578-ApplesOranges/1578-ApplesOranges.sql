-- Last updated: 29/04/2026, 23:06:10
# Write your MySQL query statement below
select
sale_date,
max(case when fruit = 'apples' then sold_num else 0 end) - max(case when fruit = 'oranges' then sold_num else 0 end) as diff
from
sales
group by 1