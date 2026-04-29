-- Last updated: 29/04/2026, 23:05:05
select 
sum(b.apple_count) + coalesce(sum(c.apple_count),0) as apple_count,
sum(b.orange_count) + coalesce(sum(c.orange_count),0) as orange_count
from
Boxes b 
left join 
chests c 
using(chest_id)