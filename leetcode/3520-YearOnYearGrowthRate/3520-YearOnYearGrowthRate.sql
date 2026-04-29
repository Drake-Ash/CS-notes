-- Last updated: 29/04/2026, 23:01:23
select
year(transaction_date) as year,
product_id,
sum(spend) as curr_year_spend,
lag(sum(spend),1) over (partition by product_id order by year(transaction_date)) as prev_year_spend,
round((sum(spend) - lag(sum(spend),1) over (partition by product_id order by year(transaction_date))) * 1.0/(lag(sum(spend),1) over (partition by product_id order by year(transaction_date))) * 100,2) as yoy_rate
from
user_transactions
group by 2,1
order by 2,1