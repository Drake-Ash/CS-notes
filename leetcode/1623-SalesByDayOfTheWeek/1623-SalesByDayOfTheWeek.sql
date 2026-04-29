-- Last updated: 29/04/2026, 23:06:01
select
i.item_category as category,
sum(case when dayofweek(order_date) = 2 then quantity else 0 end) as Monday,
sum(case when dayofweek(order_date) = 3 then quantity else 0 end) as Tuesday,
sum(case when dayofweek(order_date) = 4 then quantity else 0 end) as Wednesday,
sum(case when dayofweek(order_date) = 5 then quantity else 0 end) as Thursday,
sum(case when dayofweek(order_date) = 6 then quantity else 0 end) as Friday,
sum(case when dayofweek(order_date) = 7 then quantity else 0 end) as Saturday,
sum(case when dayofweek(order_date) = 1 then quantity else 0 end) as Sunday
from
orders o
right join
items i
on o.item_id = i.item_id
group by 1
order by 1
