-- Last updated: 29/04/2026, 23:06:30
with A as(
select
activity,
count(name) as participants
from
friends
group by
activity)


select activity from A 
where A.participants 
not in 
(
    select min(participants) from A 
    union 
    select max(participants) from A
)

