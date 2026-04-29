-- Last updated: 29/04/2026, 23:07:35
with A
as
(
    select
    business_id,
    event_type,
    occurrences,
    avg(occurrences) over (partition by event_type) as avg_occ
    from
    events
)

select
business_id
from A
where occurrences > avg_occ
group by 1
having count(distinct event_type) > 1