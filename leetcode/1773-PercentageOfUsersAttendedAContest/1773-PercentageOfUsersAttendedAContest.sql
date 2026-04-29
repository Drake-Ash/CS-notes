-- Last updated: 29/04/2026, 23:05:27
# Write your MySQL query statement below
select 
    contest_id, 
    round(100 * count(distinct user_id)/(select count(user_id) from Users) ,2) as percentage
from  
    Register
group by 
    contest_id
order by 
    percentage desc,contest_id