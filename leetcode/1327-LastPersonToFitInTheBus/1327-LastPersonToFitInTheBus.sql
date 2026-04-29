-- Last updated: 29/04/2026, 23:07:09
with A as (
select 
*,
sum(weight) over (order by turn) as running_weight
from
queue)

select 
person_name
from
A
where running_weight <= 1000
order by turn desc
limit 1