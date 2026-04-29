-- Last updated: 29/04/2026, 23:06:37
# Write your MySQL query statement below
select
ad_id,
round(ifnull((sum(case when action = 'Clicked' then 1 else 0 end) * 1.0)/(sum(case when action = 'Clicked' then 1 else 0 end) + sum(case when action = 'Viewed' then 1 else 0 end)),0) * 100,2) as ctr
from
ads
group by 1
order by 2 desc,1