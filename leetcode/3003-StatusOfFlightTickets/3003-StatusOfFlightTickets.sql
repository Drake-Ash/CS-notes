-- Last updated: 29/04/2026, 23:02:37
with A as
(
    select *,
    count(passenger_id) over (partition by flight_id order by booking_time) as pass
    from
    passengers
)

select
A.passenger_id,
case when A.pass <= f.capacity then 'Confirmed' else 'Waitlist' end as status
from
A
join
flights f
on A.flight_id = f.flight_id
order by 1