-- Last updated: 29/04/2026, 23:05:04
select user_id ,count(follower_id) as followers_count 
from Followers 
group by user_id
order by user_id asc;