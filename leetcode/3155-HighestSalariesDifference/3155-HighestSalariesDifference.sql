-- Last updated: 29/04/2026, 23:02:31
-- Write your PostgreSQL query statement below
select 
abs(max(case when department = 'Engineering' then salary else 0 end) - max(case when department = 'Marketing' then salary else 0 end)) as salary_difference
from
salaries