-- Last updated: 29/04/2026, 23:06:23
with A as(
select
stock_name,
operation_day,
max(case when operation = 'Sell' then price else 0 end) as sell_price,
max(case when operation = 'Buy' then price else 0 end) as buy_price
from
stocks
group by 1,2
order by 1,2
)

select
stock_name,
sum(sell_price - buy_price) as capital_gain_loss
from
A
group by 1