-- Last updated: 29/04/2026, 23:04:10
# Write your MySQL query statement below
select school_id, ifnull(min(score),-1) as score
from Schools left join Exam
on capacity >= student_count
group by school_id