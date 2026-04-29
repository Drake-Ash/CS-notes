-- Last updated: 29/04/2026, 23:03:25
with cte as
(
    select
    product_id,
    year(purchase_date) as year,
    count(order_id) as tot_orders
    from
    orders
    group by 1,2
    order by 1,2
)

select
distinct c1.product_id
from
cte c1
join
cte c2
on c1.product_id = c2.product_id
and c1.year + 1 = c2.year
and c1.tot_orders >= 3 and c2.tot_orders >= 3