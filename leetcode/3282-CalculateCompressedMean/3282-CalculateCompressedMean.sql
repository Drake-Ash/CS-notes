-- Last updated: 29/04/2026, 23:02:12
-- Write your PostgreSQL query statement below
select
round((sum(item_count * order_occurrences) * 1.0/sum(order_occurrences)),2) as average_items_per_order
from
orders