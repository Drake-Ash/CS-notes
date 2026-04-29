-- Last updated: 29/04/2026, 23:03:44
with A as (
select
first_col,
row_number() over (order by first_col) as rnk1
from
data),

B as (
select
second_col,
row_number() over (order by second_col desc) as rnk2
from
data)

select
A.first_col,
B.second_col
from A
join
B
on A.rnk1 = B.rnk2
