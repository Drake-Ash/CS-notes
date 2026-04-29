-- Last updated: 29/04/2026, 23:02:06
-- Write your PostgreSQL query statement below
select
max(assignment1 + assignment2 + assignment3) - min(assignment1 + assignment2 + assignment3) as difference_in_score
from
scores