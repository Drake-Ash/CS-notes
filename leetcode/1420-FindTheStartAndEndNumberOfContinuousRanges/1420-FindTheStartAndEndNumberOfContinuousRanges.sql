-- Last updated: 29/04/2026, 23:06:44
# Write your MySQL query statement below
with A as (
select
log_id,
log_id - row_number() over (order by log_id) as rnk
from logs
)

select
min(log_id) as start_id,
max(log_id) as end_id
from
A
group by rnk