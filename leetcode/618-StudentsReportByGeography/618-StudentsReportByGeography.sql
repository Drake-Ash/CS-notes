-- Last updated: 29/04/2026, 23:09:27
with A as
(
select
case when continent = 'America' then name else null end as America,
case when continent = 'Asia' then name else null end as Asia,
case when continent = 'Europe' then name else null end as Europe,
row_number() over (partition by continent order by name) as rnk
from
student
)

select 
min(America) as America,
min(Asia) as Asia,
min(Europe) as Europe
from A
group by rnk