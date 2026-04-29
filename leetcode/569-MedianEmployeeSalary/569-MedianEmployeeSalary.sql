-- Last updated: 29/04/2026, 23:10:05
with A as (
select
*,
row_number() over (partition by company order by salary) as rnk,
count(*) over (partition by company) as cnt
from
employee)

select 
id,
company,
salary
from
A
where rnk between cnt/2 and cnt/2 + 1