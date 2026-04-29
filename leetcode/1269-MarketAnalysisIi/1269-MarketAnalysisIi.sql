-- Last updated: 29/04/2026, 23:07:23
with A as
(
    select
    u.user_id,
    i.item_brand,
    u.favorite_brand,
    row_number() over (partition by u.user_id order by o.order_date) as rnk
    from
    users u
    left join
    orders o
    on u.user_id = o.seller_id
    left join
    items i
    on i.item_id = o.item_id
)

select 
user_id as seller_id,
max(case when item_brand = favorite_brand and rnk = 2 then 'yes' 
else 'no' end) as 2nd_item_fav_brand
from 
A
group by 1