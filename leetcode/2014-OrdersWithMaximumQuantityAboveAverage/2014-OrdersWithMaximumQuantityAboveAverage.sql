-- Last updated: 29/04/2026, 23:04:33
with A as (
select
order_id,
sum(quantity)/count(*) as avg_quantity,
max(quantity) as max_quantity
from
ordersdetails
group by 1)

select order_id
from
A 
where max_quantity > (select max(avg_quantity) from A)