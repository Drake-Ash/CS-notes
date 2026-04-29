-- Last updated: 29/04/2026, 23:02:25
/* Write your PL/SQL query statement below */
with cte as
    (select
        u.seller_id,
        count(distinct i.item_id) as num_items
    from
        users u
    join
        orders o on u.seller_id = o.seller_id 
    join
        items i on o.item_id = i.item_id
    where
        u.favorite_brand <> i.item_brand
    group by
        u.seller_id
    order by
        seller_id)



select
    seller_id,
    num_items
from
    (select
        seller_id,
        num_items,
        rank() over (order by num_items desc) as rnk
    from
        cte) B
where
    rnk = 1
order by seller_id
