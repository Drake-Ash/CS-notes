-- Last updated: 29/04/2026, 23:06:17
# Write your MySQL query statement below
with A as (
    select
    exam_id,
    student_id,
    score,
    min(score) over (partition by exam_id) as low,
    max(score) over (partition by exam_id) as high
    from
    exam
),

B as 
(
    select student_id
    from
    exam
    group by student_id
    having count(distinct exam_id) > 0
),

C as (
    select 
    student_id,
    exam_id,
    sum(case when low = score or high = score then 1 else 0 end) as cnt
    from
    A
    group by 1,2
),

D as (
    select student_id 
    from C 
    group by 1 
    having sum(cnt) = 0
    )

select 
distinct B.student_id,
s.student_name
from
A
join
B
on A.student_id = B.student_id
join
D
on B.student_id = D.student_id
join 
student s
on
s.student_id = B.student_id
order by 1,2

 