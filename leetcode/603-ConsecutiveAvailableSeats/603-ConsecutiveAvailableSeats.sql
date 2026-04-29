-- Last updated: 29/04/2026, 23:09:40
with A as (
select
seat_id,
seat_id - row_number() over (order by seat_id asc) as grp
from
cinema
where free = 1)

select seat_id from A where grp in (
select
grp
from
A
group by 1
having count(seat_id) > 1) 