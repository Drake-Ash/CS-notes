-- Last updated: 29/04/2026, 23:10:02
with recursive cte as
(
    select num,1 as frequency from numbers
    union all
    select cte.num,cte.frequency + 1
    from cte 
    join
    numbers
    on cte.num = numbers.num
    where cte.frequency < numbers.frequency
),

A as (
    select 
    *,
    count(num) over () as total_cnt,
    row_number() over (order by num) as rnk
    from 
    cte
),

C as
(
select 
num
from A
where rnk between total_cnt/2 and total_cnt/2 + 1
order by 1)

select 
sum(num)/count(num) as median
from C