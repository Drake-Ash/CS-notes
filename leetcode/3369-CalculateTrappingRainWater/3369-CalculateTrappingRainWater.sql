-- Last updated: 29/04/2026, 23:01:47
# Write your MySQL query statement below
with A as (
    select
    *,
    max(height) over (order by id) as left_max,
    max(height) over (order by id desc) as right_max
    from heights
)

select sum(max_height - height) as total_trapped_water
from
(
select 
case when left_max > right_max then right_max else left_max end as max_height,
height
from A
) B