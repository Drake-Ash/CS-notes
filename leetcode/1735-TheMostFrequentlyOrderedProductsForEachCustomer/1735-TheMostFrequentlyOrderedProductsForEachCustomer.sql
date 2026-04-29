-- Last updated: 29/04/2026, 23:05:33
with A as (
select
c.customer_id,
o.product_id,
p.product_name,
count(o.product_id) as product_cnt
from
customers c
join
orders o
on c.customer_id = o.customer_id
join
products p
on p.product_id = o.product_id
group by 1,2,3
)

select customer_id,
product_id,
product_name
from 
(
select customer_id,
product_id,
product_name,
dense_rank() over (partition by customer_id order by product_cnt desc) as rnk
from A
) B where rnk = 1