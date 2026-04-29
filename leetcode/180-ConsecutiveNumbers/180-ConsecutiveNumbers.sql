-- Last updated: 29/04/2026, 23:11:55
select distinct num as ConsecutiveNums from (select
*,
id - row_number() over (partition by num order by id) as rnk
from
logs
) A 
group by num,rnk
having count(*) > 2