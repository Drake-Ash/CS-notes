-- Last updated: 29/04/2026, 23:02:57
-- Write your PostgreSQL query statement below
select
person_id,
name || '(' || substring(profession,1,1) || ')' as name
from
person
order by 1 desc