-- Last updated: 29/04/2026, 23:01:37
# Write your MySQL query statement below

with free_seats as (
select *,
       seat_id - row_number() over(order by seat_id asc) as gap 
from cinema 
where free = 1
)

, free_seats_ranking as (
select min(seat_id) as first_seat_id, max(seat_id) as last_seat_id, 
       count(*) as consecutive_seats_len,
       rank() over(order by count(*)  desc) as rnk 

from free_seats
group by gap 
)

select first_seat_id, last_seat_id , consecutive_seats_len
from free_seats_ranking
where rnk=1
order by 1 asc