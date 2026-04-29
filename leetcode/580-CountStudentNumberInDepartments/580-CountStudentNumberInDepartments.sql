-- Last updated: 29/04/2026, 23:09:53
# Write your MySQL query statement below
select
d.dept_name,
count(s.student_id) as student_number
from
department d
left join
student s
on
d.dept_id = s.dept_id
group by 1
order by 2 desc,1