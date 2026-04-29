-- Last updated: 29/04/2026, 23:03:55
with nye as
(
select count(student_id) as nnum
from newyork
where score >= 90)

, cal as
(select count(student_id) as cnum
from california
where score >= 90)

select
case when nnum > cnum then "New York University"
when cnum >nnum then "California University"
else "No Winner"
end as winner
from nye, cal