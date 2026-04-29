-- Last updated: 29/04/2026, 23:05:30
with recursive cte as (
    select 1 as id from customers
    union
    select id + 1 as id from cte
    where id < (select max(customer_id) from customers)
)

select cte.id as ids
from
cte
left join
customers c
on cte.id = c.customer_id
where c.customer_id is null
order by 1