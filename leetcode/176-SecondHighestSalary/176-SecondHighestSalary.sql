-- Last updated: 29/04/2026, 23:11:59
select
max(salary) as SecondHighestSalary
from
employee
where salary < (select max(salary) from employee)