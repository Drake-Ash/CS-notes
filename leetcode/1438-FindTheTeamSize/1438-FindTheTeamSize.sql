-- Last updated: 29/04/2026, 23:06:41
-- Write your PostgreSQL query statement below
with A as
(
    select
    team_id,
    count(employee_id) as team_size
    from
    employee
    group by 1
)

select
e.employee_id,
team_size
from
employee e
left join
A
on e.team_id = A.team_id
