-- Last updated: 29/04/2026, 23:06:03
select 
    po1.id as p1,
    po2.id as p2,
    abs(po1.x_value - po2.x_value) * abs(po1.y_value - po2.y_value) as area 
from points po1
inner join points po2  
on po2.id > po1.id 
having area != 0 
order by area desc, p1, p2