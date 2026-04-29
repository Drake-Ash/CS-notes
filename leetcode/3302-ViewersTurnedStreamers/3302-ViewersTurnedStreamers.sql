-- Last updated: 29/04/2026, 23:01:59
with cte as (
select
*,
row_number() over (partition by user_id order by session_start) as rnk
from
sessions)

select
user_id,sum(case when session_type != 'Viewer' then 1 else 0 end) as sessions_count
from
cte
where user_id in (select distinct user_id from cte where rnk = 1 and session_type = 'Viewer')
group by 1
having count(user_id) > 1
order by 2 desc,1 desc