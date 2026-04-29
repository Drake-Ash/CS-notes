-- Last updated: 29/04/2026, 23:06:54
-- Write your PostgreSQL query statement below
select
p.product_id,
coalesce(round(sum(u.units * p.price) * 1.0/sum(u.units),2),0) as average_price
from
unitssold u
right join
prices p
on u.product_id = p.product_id and u.purchase_date between start_date and end_date
group by 1