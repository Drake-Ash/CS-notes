-- Last updated: 29/04/2026, 23:09:43
-- Write your PostgreSQL query statement below
with cte as (
    select *, id - (rank() over(order by id)) as chk 
    from Stadium
    where people >= 100
)

select id, visit_date, people
from cte
where chk in (
    select chk
    from cte
    group by chk
    having count(*) >= 3
)