-- Last updated: 29/04/2026, 23:02:03
with A as
(
    select
    country,
    sum(points) as points,
    winery
    from
    wineries
    group by 1,3
),

B as (
select
*,
dense_rank() over (partition by country order by points desc,winery asc) as rnk
from
A
),

C as (
select
country,
max(case when rnk = 1 then concat(winery,' (',points,')') else null end) as top_winery,
max(case when rnk = 2 then concat(winery,' (',points,')') else null end) as second_winery,
max(case when rnk = 3 then concat(winery,' (',points,')') else null end) as third_winery
from
B
group by 1
)

select
country,
top_winery,
ifnull(second_winery,'No second winery') as second_winery,
ifnull(third_winery,'No third winery') as third_winery
from
C