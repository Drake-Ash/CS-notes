-- Last updated: 29/04/2026, 23:09:58
select name, bonus from employee
left join bonus using(empid)
where bonus <1000 or bonus is null