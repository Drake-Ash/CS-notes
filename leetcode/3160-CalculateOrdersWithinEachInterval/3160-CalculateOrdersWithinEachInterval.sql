-- Last updated: 29/04/2026, 23:02:28
select
ceil(minute / 6) as interval_no,
sum(order_count) as total_orders
from
orders
group by 1
order by 1