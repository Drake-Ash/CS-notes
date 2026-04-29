-- Last updated: 29/04/2026, 23:05:55
select
distinct c.title
from
tvprogram tv
join
content c
on tv.content_id = c.content_id
where c.kids_content = 1
and year(tv.program_date) = 2020 and month(tv.program_date) = 6
and c.content_type = 'Movies'