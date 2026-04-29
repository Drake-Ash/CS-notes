-- Last updated: 29/04/2026, 23:03:22
with A as (
select *,
row_number() over (partition by gender order by user_id) as rno
from genders
)

select 
user_id,
gender 
from A
order by rno,
case when gender = 'female' then 1 when gender = 'other' then 2 else 3 end