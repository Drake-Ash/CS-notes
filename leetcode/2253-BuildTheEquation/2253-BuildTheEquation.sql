-- Last updated: 29/04/2026, 23:03:49
with A as (
select
power,
case 
when power = 1 
    then 
        concat(case when factor < 0 then cast(factor as char) else concat('+',cast(factor as char)) end,'X')
when power = 0 
    then 
        concat(case when factor < 0 then cast(factor as char) else concat('+',cast(factor as char)) end)
else 
    concat(case when factor < 0 then cast(factor as char) else concat('+',cast(factor as char)) end,'X^',cast(power as char))
end as equation
from
terms)


select 
concat(group_concat(equation order by power desc separator '' ),"=0") as equation
from A