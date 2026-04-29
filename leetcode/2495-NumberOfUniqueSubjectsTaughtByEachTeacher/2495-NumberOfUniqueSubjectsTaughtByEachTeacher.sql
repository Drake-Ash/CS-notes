-- Last updated: 29/04/2026, 23:03:11
-- Write your PostgreSQL query statement below
select
teacher_id,
count(distinct subject_id) as cnt
from
teacher
group by 1
