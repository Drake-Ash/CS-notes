-- Last updated: 29/04/2026, 23:06:26
# Write your MySQL query statement below
select
eu.unique_id,
e.name
from
employees e
left join
employeeuni eu
on e.id = eu.id