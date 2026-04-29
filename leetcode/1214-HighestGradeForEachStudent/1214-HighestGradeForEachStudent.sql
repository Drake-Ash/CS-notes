-- Last updated: 29/04/2026, 23:07:39
with A as(
select
*,
dense_rank() over (partition by student_id order by grade desc,course_id) as rnk
from
enrollments
)

select student_id,
course_id,
grade
from 
A
where rnk = 1