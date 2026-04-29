-- Last updated: 29/04/2026, 23:07:27
select distinct author_id as id from Views
where author_id = viewer_id 
order by id;