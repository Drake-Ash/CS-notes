-- Last updated: 29/04/2026, 23:06:15
# Write your MySQL query statement below
select
q.id,
q.year,
coalesce(n.npv,0) as npv
from
npv n
right join
queries q
on 
n.id = q.id
and 
n.year = q.year