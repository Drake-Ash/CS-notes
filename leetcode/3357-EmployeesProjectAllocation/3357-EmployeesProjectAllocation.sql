-- Last updated: 29/04/2026, 23:01:53
with A as (
select
e.team,
avg(p.workload) as avg_workload
from
project p 
join
employees e
on p.employee_id = e.employee_id
group by 1)

select
e.employee_id,
p.project_id,
e.name as EMPLOYEE_NAME,
p.workload as PROJECT_WORKLOAD
from
A
join
employees e
on A.team = e.team
join
project p
on e.employee_id = p.employee_id
where p.workload > A.avg_workload
order by 1,2