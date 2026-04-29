-- Last updated: 29/04/2026, 23:02:15
# Write your MySQL query statement below
select
N,
case when P is null then 'Root'
when N in (select distinct P from tree) then 'Inner'
else 'Leaf' end as Type
from
tree
order by N