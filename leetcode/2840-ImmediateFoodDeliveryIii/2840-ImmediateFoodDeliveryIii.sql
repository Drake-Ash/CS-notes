-- Last updated: 29/04/2026, 23:02:51
select
order_date,
round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) * 1.0 /count(*) * 100,2) as immediate_percentage
from
delivery
group by 1
order by 1