-- Last updated: 29/04/2026, 23:09:26
select max(num) as num from
(select
num
from
mynumbers
group by 1
having count(*) = 1) A