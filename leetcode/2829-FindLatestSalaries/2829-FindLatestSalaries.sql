-- Last updated: 29/04/2026, 23:02:54
-- Write your PostgreSQL query statement below
select
emp_id,
firstname,
lastname,
max(salary) as salary,
department_id
from
salary
group by 1,2,3,5
order by 1