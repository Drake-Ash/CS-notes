-- Last updated: 29/04/2026, 23:04:23
-- Write your PostgreSQL query statement below
with cte as (
select l1.user_id as user1_id,l2.user_id as user2_id, count( distinct l1.song_id) as song_count, l1.day
from listens l1
join listens l2 on l1.day=l2.day and l1.song_id=l2.song_id and l1.user_id<l2.user_id
group by l1.user_id ,l2.user_id ,  l1.day

)
select user1_id, user2_id from 
friendship
where (user1_id, user2_id) in 
(select user1_id, user2_id
from cte
where song_count>=3)