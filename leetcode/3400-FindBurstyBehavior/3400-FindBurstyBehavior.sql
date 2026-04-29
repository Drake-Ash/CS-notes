-- Last updated: 29/04/2026, 23:01:44
with cte as (
select user_id, post_date, 
count(1) over(partition by user_id order by post_date range between interval 6 day preceding and current row) as cnt,
count(1) over(partition by user_id)/4 as avg_weekly_posts
from posts
where post_date between '2024-02-01' and '2024-02-28'
)
select user_id, max(cnt) as max_7day_posts, avg_weekly_posts
from cte
where cnt >= 2 * avg_weekly_posts
group by 1,3
order by 1