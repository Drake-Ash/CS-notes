-- Last updated: 29/04/2026, 23:03:56
# Write your MySQL query statement below
select
account_id,
day,
sum(case when type = 'Deposit' then amount else -amount end) over (partition by account_id order by day) as balance
from
transactions