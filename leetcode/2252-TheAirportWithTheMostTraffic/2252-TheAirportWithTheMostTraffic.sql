-- Last updated: 29/04/2026, 23:03:50
# Write your MySQL query statement below

with f as
(select departure_airport as a,
flights_count
from
Flights
union all
select 
arrival_airport as a,
flights_count
from 
Flights
),
agg as
(select 
a,
sum(flights_count) as total_flights
from 
f
group by a
)
select
a as airport_id
from 
agg 
where
total_flights = (select max(total_flights) from agg)