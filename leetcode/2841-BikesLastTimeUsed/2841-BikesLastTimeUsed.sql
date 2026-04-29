-- Last updated: 29/04/2026, 23:02:49
# Write your MySQL query statement below
select
bike_number,
end_time
from
bikes
where 
(bike_number,end_time) in (select bike_number, max(end_time) from bikes group by 1)
order by 2 desc