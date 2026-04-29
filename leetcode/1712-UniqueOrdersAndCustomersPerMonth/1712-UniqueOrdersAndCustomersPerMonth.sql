-- Last updated: 29/04/2026, 23:05:39
# Write your MySQL query statement below
select
date_format(order_date,'%Y-%m') as month,
count(distinct order_id) as order_count,
count(distinct customer_id) as customer_count
from
orders
where invoice > 20
group by 1