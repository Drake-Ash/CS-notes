-- Last updated: 29/04/2026, 23:04:39
# Write your MySQL query statement below
select transaction_id
from
(
select
transaction_id,
dense_rank() over (partition by date_format(day,'%Y-%m-%d') order by amount desc) as rnk
from
transactions
) A
where rnk = 1
order by 1