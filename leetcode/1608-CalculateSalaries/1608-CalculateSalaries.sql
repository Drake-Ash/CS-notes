-- Last updated: 29/04/2026, 23:06:02
-- Write your PostgreSQL query statement below
with A as (
select
*,
max(salary) over (partition by company_id) as max_sal
from salaries)

select
company_id,
employee_id,
employee_name,
round(case when max_sal < 1000 then salary
when 1000 <= max_sal and max_sal <= 10000 then salary - (0.24 * salary) 
else salary - (0.49 * salary) end) as salary
from A