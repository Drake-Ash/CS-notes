-- Last updated: 29/04/2026, 23:01:40
with A as (
select
c.first_name,
ca.type,
ca.duration,
concat_ws(':',LPAD(floor((ca.duration/3600)), 2, '0'),LPAD(floor((ca.duration%3600)/60), 2, '0'),LPAD(floor((ca.duration%60)), 2, '0')) as duration_formatted
from
contacts c
join
calls ca
on c.id = ca.contact_id
),

B as (
select first_name,type,duration_formatted from A 
where type = 'incoming' order by type desc,duration desc,first_name desc limit 3 ),

C as (
select first_name,type,duration_formatted from A 
where type = 'outgoing' order by type desc,duration desc,first_name desc limit 3)

select * from B
union
select * from C