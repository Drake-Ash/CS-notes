-- Last updated: 29/04/2026, 23:03:57
# Write your MySQL query statement below

select 
    member_id
    , name
    , case
        when count(v.visit_id) = 0 then "Bronze"
        when 100 * count(p.visit_id) / count(v.visit_id) >= 80 then "Diamond"
        when 100 * count(p.visit_id) / count(v.visit_id) >= 50 then "Gold"
        else "Silver"
    end as category
from Members m
left join Visits v using(member_id)
left join Purchases p using(visit_id)
group by member_id