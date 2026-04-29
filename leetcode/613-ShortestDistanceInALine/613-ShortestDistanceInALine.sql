-- Last updated: 29/04/2026, 23:09:31
select min(abs(p1.x-p2.x)) as shortest
from point p1
join point p2 
where p1.x!=p2.x