-- Last updated: 29/04/2026, 23:07:06
select
query_name,
round(sum(rating * 1.0/position)/count(*),2) as quality,
round((sum(case when rating < 3 then 1 else 0 end) * 1.0/count(*)) * 100,2) as poor_query_percentage
from
queries
where query_name is not null
group by query_name