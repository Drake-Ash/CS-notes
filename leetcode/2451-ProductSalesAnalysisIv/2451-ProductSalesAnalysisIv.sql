-- Last updated: 29/04/2026, 23:03:19
with A as (
select
s.user_id,
s.product_id,
sum(s.quantity * p.price) as total
from
sales s
join
product p
on s.product_id = p.product_id
group by 1,2)

select user_id,
product_id
from
(
select
*,
dense_rank() over (partition by user_id order by total desc) as rnk
from A) B where rnk = 1