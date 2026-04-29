-- Last updated: 29/04/2026, 23:09:20
-- Write your PostgreSQL query statement below
select
case when id % 2 <> 0 then lead(id,1,id) over(order by id)
when id % 2 = 0 then lag(id,1,id) over(order by id)
end as id,
student
from
seat
order by 1