-- Last updated: 29/04/2026, 23:04:16
select
coalesce(e.employee_id,s.employee_id) as employee_id
from
employees e
full outer join
salaries s
on e.employee_id = s.employee_id
where e.name is null or s.salary is null