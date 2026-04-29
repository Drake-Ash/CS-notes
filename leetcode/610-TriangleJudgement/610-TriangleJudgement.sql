-- Last updated: 29/04/2026, 23:09:34
-- Write your PostgreSQL query statement below
select
*,
case 
when x + y > z and y + z > x and z + x > y then 'Yes' else 'No' end as triangle
from
triangle