-- Last updated: 29/04/2026, 23:03:09
with A as (
select
pu.invoice_id,
sum(pu.quantity * p.price) as total
from
products p
join
purchases pu
on p.product_id = pu.product_id
group by 1)

select
p.product_id,
pu.quantity,
pu.quantity * p.price as price
from
products p
join
purchases pu
on p.product_id = pu.product_id
where pu.invoice_id in (select invoice_id from (
select invoice_id,
dense_rank() over (order by total desc,invoice_id) as rnk
from A)B where rnk = 1)