-- Last updated: 29/04/2026, 23:06:31
-- Write your PostgreSQL query statement below
select
s.id,
s.name
from
students s
left join
departments d
on s.department_id = d.id
where d.id is null