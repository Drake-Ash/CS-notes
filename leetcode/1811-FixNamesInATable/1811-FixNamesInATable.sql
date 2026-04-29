-- Last updated: 29/04/2026, 23:05:15
select user_id,
    concat(upper(left(name, 1)), lower(substring(name, 2)))
    as name
from Users
order by user_id;