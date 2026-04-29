-- Last updated: 29/04/2026, 23:04:40
-- Write your PostgreSQL query statement below
select
customer_id
from
customers
where year = 2021
group by 1
having sum(revenue) > 0