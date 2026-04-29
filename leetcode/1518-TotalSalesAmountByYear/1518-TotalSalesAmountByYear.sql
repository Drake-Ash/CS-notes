-- Last updated: 29/04/2026, 23:06:24
with recursive dates
as 
(
select
product_id,period_start,period_end,average_daily_sales
from
sales s
union all
select r.product_id,DATE_ADD(r.period_start, INTERVAL 1 DAY) as period_start,r.period_end,r.average_daily_sales
from
dates r where r.period_start < r.period_end
)

select
cast(p.product_id as UNSIGNED) as product_id,
p.product_name,
cast(year(d.period_start) as CHAR) as report_year,
sum(d.average_daily_sales) as total_amount
from
dates d
left join 
product p
on
d.product_id = p.product_id
group by 1,2,3
order by 1