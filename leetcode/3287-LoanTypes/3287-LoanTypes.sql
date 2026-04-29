-- Last updated: 29/04/2026, 23:02:04
# Write your MySQL query statement below
select
user_id
from
loans
group by 1
having (sum(case when loan_type = 'Refinance' then 1 else 0 end) > 0) and
(sum(case when loan_type = 'Mortgage' then 1 else 0 end) > 0)
order by 1