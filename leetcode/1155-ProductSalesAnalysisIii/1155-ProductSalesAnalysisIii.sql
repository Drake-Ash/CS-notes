-- Last updated: 29/04/2026, 23:08:02
select product_id,year as first_year,quantity,price
from
(
select
*,
dense_rank() over (partition by product_id order by year) as rnk
from
sales s ) A
where rnk = 1