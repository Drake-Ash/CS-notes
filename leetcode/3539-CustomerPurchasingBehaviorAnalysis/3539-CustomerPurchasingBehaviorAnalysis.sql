-- Last updated: 29/04/2026, 23:01:18
with cte as (
    select customer_id, transaction_id, product_id, transaction_date, amount,
    category
    from transactions
    left join products using (product_id)
),
cte1 as (
    select customer_id,
    sum(amount) as total_amount, 
    count(transaction_id) as transaction_count,
    count(distinct category) as unique_categories,
    round(sum(amount) / count(transaction_id), 2) as avg_transaction_amount,
    round(count(transaction_id) * 10 + sum(amount) / 100.0, 2) as loyalty_score
    from cte
    group by customer_id
),
cte2 as (
    select customer_id, category, 
    count(category) as freq,
    max(transaction_date) as most_recent
    from cte
    group by customer_id, category
),
cte3 as (
    select customer_id, category,
    rank() over (partition by customer_id order by freq desc, most_recent desc) as rk
    from cte2
),
cte4 as (
    select customer_id, category as top_category
    from cte3
    where rk = 1
)

select customer_id, total_amount, transaction_count, unique_categories, avg_transaction_amount, 
top_category,
loyalty_score
from cte1
left join cte4 using (customer_id)
order by loyalty_score desc, customer_id asc