-- Last updated: 29/04/2026, 23:03:00
-- Write your PostgreSQL query statement below
select
s1.symbol as metal,
s2.symbol as nonmetal
from
elements s1
join
elements s2
on
s1.symbol != s2.symbol and  
s1.type = 'Metal' and s2.type ='Nonmetal'