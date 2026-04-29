-- Last updated: 29/04/2026, 23:09:59
select 
Name 
from Candidate 
where id = (
    select candidateid 
    from Vote 
    group by candidateid 
    order by count(candidateid) desc limit 1
    )