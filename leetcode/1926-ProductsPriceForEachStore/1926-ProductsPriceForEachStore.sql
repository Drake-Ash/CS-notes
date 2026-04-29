-- Last updated: 29/04/2026, 23:04:52
# Write your MySQL query statement below
select
product_id,
max(case when store = 'store1' then price else null end) as store1,
max(case when store = 'store2' then price else null end) as store2,
max(case when store = 'store3' then price else null end) as store3
from
products
group by 1