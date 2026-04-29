-- Last updated: 29/04/2026, 23:05:20
with A as (
select
r.requested_at,
month(r.requested_at) as mon,
ar.ride_distance,
ar.ride_duration
from
rides r
join
acceptedrides ar
on r.ride_id = ar.ride_id
where year(r.requested_at) = 2020
order by 1
),

B as (
        select 1 as mon from rides
    union
        select 2 as mon from rides
    union
        select 3 as mon from rides
    union
        select 4 as mon from rides
    union
        select 5 as mon from rides
    union
        select 6 as mon from rides
    union
        select 7 as mon from rides
    union
        select 8 as mon from rides
    union
        select 9 as mon from rides
    union
        select 10 as mon from rides
    union
        select 11 as mon from rides
    union
        select 12 as mon from rides
),


C as (
select 
B.mon,
sum(IFNULL(A.ride_distance,0)) as ride_distance,
sum(IFNULL(A.ride_duration,0)) as ride_duration
from B
left join 
A
on A.mon = B.mon
group by 1)

select * from (
select
mon as month,
round(avg(ride_distance) over (order by mon rows between current row and 2 following),2) as average_ride_distance,
round(avg(ride_duration) over (order by mon rows between current row and 2 following),2) as average_ride_duration
from C) D
where month < 11