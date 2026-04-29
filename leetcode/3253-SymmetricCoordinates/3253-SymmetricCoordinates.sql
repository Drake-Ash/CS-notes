-- Last updated: 29/04/2026, 23:02:22
/* Write your T-SQL query statement below */
select distinct a.x,a.y
from coordinates a
join coordinates b 
on a.x=b.y and a.y=b.x
where a.x<a.y
union 
select x,y  
from coordinates
where x=y
group by x,y
having count(*)>=2
order by x,y