-- Last updated: 29/04/2026, 23:03:43
with A as (
select
*,
row_number() over (partition by player_id,result order by match_day) 
- row_number() over (partition by player_id order by match_day) as grp
from
matches
)

SELECT m.player_id, coalesce(MAX(cnt), 0) AS longest_streak
FROM Matches m
left join (
select
player_id,
grp,
count(grp) as cnt
from
A
where result = 'Win'
group by 1,2) B
on m.player_id = B.player_id
group by 1