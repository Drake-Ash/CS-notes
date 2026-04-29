-- Last updated: 29/04/2026, 23:04:35
-- Write your PostgreSQL query statement below
select to_char(day, 'FMDay, FMMonth FMDD, YYYY') as day
from Days