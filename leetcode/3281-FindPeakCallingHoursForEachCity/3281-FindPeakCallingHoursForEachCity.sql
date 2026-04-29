-- Last updated: 29/04/2026, 23:02:13
with A as (
select
city,
hour(call_time) as peak_calling_hour,
count(caller_id) as number_of_calls
from
calls
group by 1,2)


select 
city,
peak_calling_hour,
number_of_calls
from
(
select 
city,
peak_calling_hour,
number_of_calls,
max(number_of_calls) over (partition by city) as max_calls
from
A
) B
where number_of_calls = max_calls
order by 2 desc, 1 desc