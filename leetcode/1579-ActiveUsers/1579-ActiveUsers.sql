-- Last updated: 29/04/2026, 23:06:08
with cte as (
select
id,
login_date,
row_number() over (partition by id order by login_date) as rnk
from
logins
group by 1,2),

B as
(
select
id,
date_sub(login_date,interval rnk day) as grp
from 
cte
group by 1,2
having count(id) > 4
) 

select
B.id,
A.name
from
B
join
accounts A
on A.id = B.id
group by 1,2
order by 1