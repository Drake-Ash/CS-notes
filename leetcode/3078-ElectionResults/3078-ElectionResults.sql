-- Last updated: 29/04/2026, 23:02:35
with A as (
select
voter,
1/count(voter) as share
from
votes
where candidate is not null
group by voter
)

select candidate from (
select candidate,
dense_rank() over (order by tot desc) as rnk 
from ( 
select 
candidate,
sum(A.share) as tot
from
votes v
join 
A
on v.voter = A.voter
group by 1
order by 1) A
) B where rnk = 1