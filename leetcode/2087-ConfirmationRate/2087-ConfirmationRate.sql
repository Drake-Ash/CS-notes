-- Last updated: 29/04/2026, 23:04:22
select 
s.user_id , 
round(avg(case when c.action = 'confirmed' then 1 else 0 end), 2) as confirmation_rate
from signups s 
left join 
confirmations c
on s.user_id = c.user_id
group by s.user_id