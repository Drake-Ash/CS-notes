-- Last updated: 29/04/2026, 23:06:34
with recursive cte1 as (
    select 
        v.user_id
        , v.visit_date 
        , sum(case when t.transaction_date is not null then 1 else 0 end ) as transactions_count
    from Visits as v
    left join Transactions as t on v.visit_date = t.transaction_date and v.user_id = t.user_id
    group by  v.user_id, visit_date
), cte2 as (
    select 0 as transactions_count
    from cte1 
    union 
    select transactions_count + 1
    from cte2
    where transactions_count + 1 <= (select max(transactions_count) from cte1)
)
select 
    c2.transactions_count
    , count(c1.visit_date) as visits_count
from cte2 as c2
left join cte1 as c1 on c2.transactions_count = c1.transactions_count
group by c2.transactions_count
order by c2.transactions_count;