-- Last updated: 29/04/2026, 23:08:04
# Write your MySQL query statement below
select
p.product_id,
sum(s.quantity) as total_quantity
from
product p 
join
sales s
on p.product_id = s.product_id
group by 1