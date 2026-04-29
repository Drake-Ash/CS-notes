-- Last updated: 29/04/2026, 23:05:35
# Write your MySQL query statement below
select
u.name,
sum(t.amount) as balance
from
users u
join
transactions t
on u.account = t.account
group by 1
having sum(t.amount) > 10000
