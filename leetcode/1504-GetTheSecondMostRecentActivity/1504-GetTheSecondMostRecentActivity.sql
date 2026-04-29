-- Last updated: 29/04/2026, 23:06:27
with A as (
select
*,
row_number() over (partition by username order by startdate desc) as rnk,
count(username) over (partition by username) as cnt
from
useractivity)

select  username,activity,startDate,endDate
from A 
where rnk = 2 or (rnk = 1 and cnt = 1)