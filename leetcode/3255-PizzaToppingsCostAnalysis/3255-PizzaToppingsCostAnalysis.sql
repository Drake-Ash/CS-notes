-- Last updated: 29/04/2026, 23:02:21
select 
concat_ws(",",t1.topping_name,t2.topping_name,t3.topping_name) as pizza,
t1.cost+t2.cost+t3.cost as total_cost
from
Toppings t1 
inner join 
Toppings t2
on t1.topping_name < t2.topping_name
inner join 
Toppings t3
on t2.topping_name < t3.topping_name
order by total_cost desc, pizza asc