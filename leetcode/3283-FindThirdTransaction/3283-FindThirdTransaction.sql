-- Last updated: 29/04/2026, 23:02:10
with A as (
select
*,
row_number() over (partition by user_id order by transaction_date asc) as rnk,
count(user_id) over (partition by user_id) as cnt
from
transactions),

B as (
select
*,
lag(spend,1,0) over (partition by user_id order by transaction_date) as t2,
lag(spend,2,0) over (partition by user_id order by transaction_date) as t1
from
A
where rnk <= 3 and cnt >= 3)


select 
user_id,
spend as third_transaction_spend,
transaction_date as third_transaction_date
from
B
where rnk = 3 and spend - t2 > 0 and spend - t1 > 0
order by 1