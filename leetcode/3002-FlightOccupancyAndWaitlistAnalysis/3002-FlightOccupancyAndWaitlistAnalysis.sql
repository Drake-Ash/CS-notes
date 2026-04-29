-- Last updated: 29/04/2026, 23:02:38
select
f.flight_id,
ifnull(case when p.bookings >= f.capacity then f.capacity else p.bookings end,0) as booked_cnt,
ifnull(case when p.bookings >= f.capacity then p.bookings - f.capacity else 0 end,0) as waitlist_cnt
from
flights f
left join
(select flight_id, count(passenger_id) as bookings from passengers group by 1) p
on f.flight_id = p.flight_id
order by 1