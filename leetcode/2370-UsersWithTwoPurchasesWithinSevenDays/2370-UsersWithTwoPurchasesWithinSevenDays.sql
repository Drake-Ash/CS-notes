-- Last updated: 29/04/2026, 23:03:35
with cte as (
select
user_id,
purchase_date,
row_number() over (partition by user_id order by purchase_date) as rnk,
count(user_id) over (partition by user_id) as total_purchases
from 
purchases
order by user_id,purchase_date)

select 
distinct c1.user_id
from
cte c1
join
cte c2
on c1.user_id = c2.user_id
where c1.total_purchases > 1
and c1.rnk + 1 = c2.rnk
and DATEDIFF(c2.purchase_date,c1.purchase_date) <= 7