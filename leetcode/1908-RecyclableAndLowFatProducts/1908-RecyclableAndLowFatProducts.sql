-- Last updated: 29/04/2026, 23:04:56
-- Write your PostgreSQL query statement below
select
product_id
from
products
where
low_fats = 'Y'
and 
recyclable = 'Y'
