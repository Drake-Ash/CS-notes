-- Last updated: 29/04/2026, 23:04:30
with A as (
select
salary
from
employees
group by 1
having count(salary) > 1
),

B as (
    select
    *,
    dense_rank() over (order by salary) as team_id
    from
    employees
    where salary in (select salary from A)
)

select * from B
order by 4,1