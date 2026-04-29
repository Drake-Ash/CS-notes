-- Last updated: 29/04/2026, 23:05:14
# Write your MySQL query statement below
select name , COALESCE(sum(rest) , 0) as rest , COALESCE(sum(paid) , 0) as paid , COALESCE(sum(canceled) , 0) as canceled , COALESCE(sum(refunded) , 0) as refunded
from Product left join Invoice using (product_id)
group by product_id
order by name