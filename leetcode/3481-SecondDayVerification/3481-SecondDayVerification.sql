-- Last updated: 29/04/2026, 23:01:31
# Write your MySQL query statement below
select
e.user_id
from
emails e
join
texts t
on e.email_id = t.email_id
where t.signup_action = 'Verified'
and date(e.signup_date) + 1 = date(t.action_date)
order by 1