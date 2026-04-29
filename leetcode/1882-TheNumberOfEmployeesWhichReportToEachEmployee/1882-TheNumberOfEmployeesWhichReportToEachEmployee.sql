-- Last updated: 29/04/2026, 23:05:02
select
e1.employee_id,
e1.name,
count(e2.reports_to) as reports_count,
round(avg(e2.age)) as average_age
from
employees e1
join 
employees e2
on e1.employee_id = e2.reports_to
group by 1,2
order by 1