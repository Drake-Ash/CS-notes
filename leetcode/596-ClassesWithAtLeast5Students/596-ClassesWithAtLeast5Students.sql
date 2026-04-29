-- Last updated: 29/04/2026, 23:09:46
# Write your MySQL query statement below
select 
    class
from 
    courses
group by 
    class
having 
    count(student) >= 5 ;