-- Last updated: 29/04/2026, 23:07:25
select distinct viewer_id as id 
from
(
select
viewer_id,
view_date
from
views
group by 1,2
having count(distinct article_id) > 1) A
order by 1