-- Last updated: 29/04/2026, 23:02:02
# Write your MySQL query statement below
select
FLOOR((DayOfMonth(purchase_date)-1)/7)+1 as week_of_month,
purchase_date,
sum(amount_spend) as total_amount
from
purchases
where dayofweek(purchase_date) = 6
group by 1,2
order by 1