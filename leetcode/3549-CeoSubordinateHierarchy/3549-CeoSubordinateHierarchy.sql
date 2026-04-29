-- Last updated: 29/04/2026, 23:01:20
with recursive cte as 
(
    select employee_id,employee_name,0 as hierarchy_level,salary
    from
    employees where manager_id is null
    union 
    select emp.employee_id,emp.employee_name,cte.hierarchy_level + 1,emp.salary
    from
    employees emp
    join
    cte 
    on cte.employee_id = emp.manager_id
)

select
employee_id as subordinate_id,
employee_name as subordinate_name,
hierarchy_level,
salary - (select salary from employees where manager_id is null) as salary_difference
from cte
where hierarchy_level <> 0