-- Last updated: 29/04/2026, 23:06:33
with A as
(
    select
    u.name,
    count(mr.rating) as ratings
    from
    movierating mr
    join
    movies m
    on mr.movie_id = m.movie_id
    join
    users u
    on u.user_id = mr.user_id
    group by 1
),

B as
(
    select
    m.title,
    avg(mr.rating) as ratings
    from
    movierating mr
    join
    movies m
    on mr.movie_id = m.movie_id
    join
    users u
    on u.user_id = mr.user_id
    where extract(year from created_at) = 2020
    and extract(month from created_at) = 2
    group by 1
)

(select name as results
from A
order by ratings desc,name asc limit 1)
union all
(select title as results 
from B
order by ratings desc,title asc limit 1)