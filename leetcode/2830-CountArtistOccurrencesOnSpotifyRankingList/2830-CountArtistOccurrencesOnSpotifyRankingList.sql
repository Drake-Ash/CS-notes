-- Last updated: 29/04/2026, 23:02:53
-- Write your PostgreSQL query statement below
select
artist,
count(artist) as occurrences
from
spotify
group by 1
order by 2 desc,1 asc