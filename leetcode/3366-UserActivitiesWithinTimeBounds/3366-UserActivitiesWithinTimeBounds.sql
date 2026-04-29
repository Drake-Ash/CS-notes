-- Last updated: 29/04/2026, 23:01:49
select distinct s1.user_id
from sessions s1 join sessions s2
on s1.user_id = s2.user_id and s1.session_id <> s2.session_id 
and s1.session_type = s2.session_type and s2.session_end >= s1.session_end
where timestampdiff(hour,s1.session_end, s2.session_start) <= 12
order by 1