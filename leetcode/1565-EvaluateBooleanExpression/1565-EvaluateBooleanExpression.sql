-- Last updated: 29/04/2026, 23:06:13
select
e.left_operand,
e.operator,
e.right_operand,
case 
when e.operator = '>' then cast(v1.value > v2.value as varchar)
when e.operator = '<' then cast(v1.value < v2.value as varchar)
else cast(v1.value = v2.value as varchar) end as value
from
expressions e
join
variables v1
on e.left_operand = v1.name
join
variables v2
on e.right_operand = v2.name