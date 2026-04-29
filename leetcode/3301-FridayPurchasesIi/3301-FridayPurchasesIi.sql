-- Last updated: 29/04/2026, 23:02:00
with recursive dates as (
    select cast('2023-11-01' as date) as purchase_date from purchases
    union
    select purchase_date + 1 from dates
    where purchase_date < cast('2023-11-30' as date)
),

A as (
    select d.purchase_date,
    coalesce(p.amount_spend,0) as amount
    from
    dates d
    left join
    purchases p
    on d.purchase_date = p.purchase_date
),

B as (
    select
    to_char(purchase_date, 'W') as week_of_month,
    purchase_date,
    amount
    from
    A 
)

select cast(week_of_month as int),
purchase_date,
sum(amount) as total_amount 
from B 
where date_part('dow',purchase_date::date) = 5 
group by 1,2
order by 1