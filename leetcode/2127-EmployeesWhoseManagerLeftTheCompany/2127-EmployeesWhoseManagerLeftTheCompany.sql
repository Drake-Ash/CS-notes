-- Last updated: 29/04/2026, 23:04:11
select
employee_id
from employees
where salary < 30000 
and manager_id not in (select distinct employee_id from employees)
order by 1