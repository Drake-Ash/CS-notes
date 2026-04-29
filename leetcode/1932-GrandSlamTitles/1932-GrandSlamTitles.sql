-- Last updated: 29/04/2026, 23:04:51
-- Write your PostgreSQL query statement below
with A as
(
    select wimbledon as slams from championships
    union all
    select Fr_open as slams from championships
    union all
    select US_open as slams from championships
    union all
    select Au_open as slams from championships
)

select
p.player_id,
p.player_name,
count(A.slams) as grand_slams_count
from
players p
join
A
on p.player_id = A.slams
group by 1,2