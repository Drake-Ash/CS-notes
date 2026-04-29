-- Last updated: 29/04/2026, 23:05:41
with A as (
    select
    paid_by as user_id,-amount as amount
    from
    transactions
    union all
    select
    paid_to,amount
    from
    transactions
)

select
u.user_id,
u.user_name,
u.credit + ifnull(B.amount,0) as credit,
case when u.credit + ifnull(B.amount,0) < 0 then 'Yes' else 'No' end as credit_limit_breached
from
users u
left join
(select user_id,sum(amount) as amount from A group by 1) B
on
u.user_id = B.user_id