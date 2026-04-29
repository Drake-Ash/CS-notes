-- Last updated: 29/04/2026, 23:09:19
# Write your MySQL query statement below
update salary
set sex = case when sex = 'm' then 'f' else 'm' end