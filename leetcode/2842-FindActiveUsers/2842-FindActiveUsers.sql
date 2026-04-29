-- Last updated: 29/04/2026, 23:02:48
with cte as (
select
user_id,
created_at,
row_number() over (partition by user_id order by created_at) as rnk,
count(user_id) over (partition by user_id) as total_purchases
from 
Users
order by user_id,created_at)

select 
distinct c1.user_id
from
cte c1
join
cte c2
on c1.user_id = c2.user_id
where c1.total_purchases > 1
and c1.rnk + 1 = c2.rnk
and DATEDIFF(c2.created_at,c1.created_at) <= 7