-- Last updated: 29/04/2026, 23:05:10
# Write your MySQL query statement below
select
date_id,
make_name,
count(distinct lead_id) as unique_leads,
count(distinct partner_id) as unique_partners
from
dailysales
group by 1,2
