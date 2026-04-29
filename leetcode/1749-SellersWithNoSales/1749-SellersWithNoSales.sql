-- Last updated: 29/04/2026, 23:05:32
# Write your MySQL query statement below
select
s.seller_name
from
seller s
left join
(select * from orders where year(sale_date) = 2020) o
on s.seller_id = o.seller_id
where o.seller_id is null
order by 1