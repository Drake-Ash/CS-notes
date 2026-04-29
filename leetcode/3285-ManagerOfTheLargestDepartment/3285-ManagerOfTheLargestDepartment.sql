-- Last updated: 29/04/2026, 23:02:07
# Write your MySQL query statement below
with A as (
    select
    dep_id,
    count(emp_id) as total
    from
    employees
    group by dep_id
)


select 
emp_name as manager_name,
dep_id
from
employees
where position = 'Manager'
and dep_id in (
select dep_id from A where total = (select max(total) from A))
order by dep_id asc