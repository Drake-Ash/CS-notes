-- Last updated: 29/04/2026, 23:09:35
-- Write your PostgreSQL query statement below
select
id,
case when p_id is null then 'Root'
when id not in (select distinct p_id from tree where p_id is not null) then 'Leaf'
else 'Inner'
end as type
from tree