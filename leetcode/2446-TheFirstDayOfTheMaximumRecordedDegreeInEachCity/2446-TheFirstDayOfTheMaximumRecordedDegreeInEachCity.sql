-- Last updated: 29/04/2026, 23:03:21
select city_id,day,degree
from
(
select
w1.city_id,
w1.day,
min(w1.day) over (partition by w1.city_id,w1.degree) as first_day,
w1.degree
from
weather w1
join 
(select city_id,max(degree) as max_degree from weather group by 1) w2
on w1.city_id = w2.city_id
and w1.degree = w2.max_degree
)
where first_day = day 
order by 1