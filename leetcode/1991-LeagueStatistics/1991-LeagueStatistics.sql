-- Last updated: 29/04/2026, 23:04:38
with A 
as
(
    select
    home_team_id as team,
    home_team_goals as goals_for,
    away_team_goals as goals_against,
    case when home_team_goals > away_team_goals then 3
    when home_team_goals = away_team_goals then 1
    else 0 end as score
    from
    matches
    union all
    select
    away_team_id as team,
    away_team_goals as goals_for,
    home_team_goals as goals_against,
    case when home_team_goals < away_team_goals then 3
    when home_team_goals = away_team_goals then 1
    else 0 end as score
    from
    matches
)

select
t.team_name,
count(A.team) as matches_played,
sum(A.score) as points,
sum(goals_for) as goal_for,
sum(goals_against) as goal_against,
sum(goals_for) - sum(goals_against) as goal_diff
from A
join
teams t
on
t.team_id = A.team
group by 1
order by 3 desc,6 desc,1