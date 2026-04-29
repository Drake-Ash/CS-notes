-- Last updated: 29/04/2026, 23:04:00
-- Write your PostgreSQL query statement below
select
problem_id
from
problems
where (likes * 1.0)/(likes + dislikes) * 100 < 60
order by 1