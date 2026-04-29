-- Last updated: 29/04/2026, 23:08:05
# Write your MySQL query statement below
select
p.product_name,
s.year,
s.price
from
product p
join
sales s
on p.product_id = s.product_id
