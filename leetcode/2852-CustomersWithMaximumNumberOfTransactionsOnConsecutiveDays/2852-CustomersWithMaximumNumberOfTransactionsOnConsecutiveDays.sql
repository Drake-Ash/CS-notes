-- Last updated: 29/04/2026, 23:02:46
with cte as 
(
    select
    customer_id,
    transaction_date,
    row_number() over (partition by customer_id order by transaction_date) as rnk
    from
    transactions
),

A as (
select *
,DATE_SUB(transaction_date, INTERVAL rnk DAY) as grp
from cte),

B as (
select grp,customer_id,count(*) as cons
from
A
group by 1,2)

select customer_id from B where cons = (select max(cons) from B)