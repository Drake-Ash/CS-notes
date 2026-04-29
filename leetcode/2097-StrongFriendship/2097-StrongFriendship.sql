-- Last updated: 29/04/2026, 23:04:18
with allfriends as (
    select user1_id as user, user2_id as friend
    from Friendship
    UNION ALL
    select user2_id as user, user1_id as friend
    from Friendship)
    
select a.user as user1_id, b.user as user2_id, count(*) as common_friend
from allfriends a
join allfriends b
where a.user < b.user AND a.friend = b.friend and (a.user, b.user) in (select user, friend from allfriends)
group by 1, 2
having common_friend >=3