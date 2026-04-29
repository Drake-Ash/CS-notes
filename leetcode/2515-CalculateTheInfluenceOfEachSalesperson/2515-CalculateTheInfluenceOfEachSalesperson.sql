-- Last updated: 29/04/2026, 23:03:07
# Write your MySQL query statement below
select
s.salesperson_id,
s.name,
coalesce(sum(sa.price),0) as total
from
salesperson s 
left join
customer c
on s.salesperson_id = c.salesperson_id
left join
sales sa
on sa.customer_id = c.customer_id
group by 1,2