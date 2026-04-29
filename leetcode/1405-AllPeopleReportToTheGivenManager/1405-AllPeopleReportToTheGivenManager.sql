-- Last updated: 29/04/2026, 23:06:47
-- Write your PostgreSQL query statement below
with recursive cte as (
    select employee_id 
    from employees where manager_id = 1 and employee_id <> 1
    union
    select employees.employee_id
    from employees
    join cte on employees.manager_id = cte.employee_id

)

select * from cte