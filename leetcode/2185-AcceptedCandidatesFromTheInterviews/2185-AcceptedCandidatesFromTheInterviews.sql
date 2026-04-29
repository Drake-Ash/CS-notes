-- Last updated: 29/04/2026, 23:03:59
# Write your MySQL query statement below
select
c.candidate_id
from
candidates c
join
rounds r
on c.interview_id = r.interview_id
where c.years_of_exp >= 2
group by 1
having sum(r.score) > 15