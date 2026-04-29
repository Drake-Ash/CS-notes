-- Last updated: 29/04/2026, 23:02:09
with A as (
select
city,
avg(price) over (partition by city) as avg_home,
avg(price) over () as national_avg
from
listings 
)

select distinct city
from
A
where
avg_home > national_avg
order by 1