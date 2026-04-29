-- Last updated: 29/04/2026, 23:02:19
select
candidate_id
from
candidates
where skill in ('Python','Tableau','postgreSQL')
group by candidate_id
having count(skill) >= 3
order by 1