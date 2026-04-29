-- Last updated: 29/04/2026, 23:01:28
# Write your MySQL query statement below
with t1 as(
    select s.student_id, s.major, c.course_id, c.mandatory
    from Students s
    join Courses c on s.major = c.major
),
t2 as(
    select t1.student_id, t1.course_id, t1.mandatory, e.course_id as cid, e.grade, e.GPA
    from t1
    left join enrollments e on t1.student_id = e.student_id and t1.course_id = e.course_id
),
t3 as(
    select distinct student_id
    from t2
    group by 1
    having sum(case when mandatory = 'yes' and cid is null then 1 else 0 end) = 0
    and sum(case when mandatory = 'no' and cid is not null then 1 else 0 end) >= 2
),
t4 as(
    select distinct student_id
    from t2
    group by 1
    having sum(case when mandatory = 'yes' and grade != 'A' then 1 else 0 end) = 0
    and sum(case when mandatory = 'no' and grade not in('A', 'B') then 1 else 0 end) = 0
)
select student_id
from enrollments e
join courses c on e.course_id = c.course_id
group by 1
having round(sum(GPA*credits)/sum(credits), 1) >= 2.5
and student_id in (select student_id from t3)
and student_id in (select student_id from t4)
order by 1
