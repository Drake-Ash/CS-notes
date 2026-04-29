-- Last updated: 29/04/2026, 23:07:00
with fail as 
(
    select
    'failed' as period_state,
    fail_date
    from
    failed
    where year(fail_date) = 2019
),

success as 
(
    select
    'succeeded' as period_state,
    success_date
    from
    Succeeded
    where year(success_date) = 2019
),

all_states as (
select * from fail
union
select * from success
)

select
period_state,
min(fail_date) as start_date,
max(fail_date) as end_date
from
(
select 
period_state,
fail_date,
DATE_ADD(fail_date, INTERVAL -row_number() over (partition by period_state order by fail_date) DAY) as grp
from all_states
)
A
group by grp,period_state
order by 2