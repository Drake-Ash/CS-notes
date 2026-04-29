-- Last updated: 29/04/2026, 23:12:01
# Write your MySQL query statement below
# Write your MySQL query statement below
select firstname, lastname, city, state from person
left join address using(personid)