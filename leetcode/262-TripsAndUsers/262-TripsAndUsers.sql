-- Last updated: 29/04/2026, 23:10:59
with cancelled as
(
    select t.*,
    case when status = 'cancelled_by_driver' or status = 'cancelled_by_client' then 1 else 0 end as flag
    from
    trips t
    join users u1
    on t.client_id = u1.users_id
    join users u2
    on t.driver_id = u2.users_id
    where 
    u1.banned = 'No' and u2.banned = 'No'
    and request_at::DATE BETWEEN '2013-10-01'::DATE AND '2013-10-03'::DATE
)

select
request_at as Day,
round(1.0 * sum(flag)/count(flag),2) as "Cancellation Rate"
from
cancelled
group by 1
order by 1