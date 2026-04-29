-- Last updated: 29/04/2026, 23:04:02
select
count(st.account_id) as accounts_count
from
subscriptions s
left join
(select * from streams where extract(year from stream_date) <> 2021) st
on s.account_id = st.account_id
where
extract(year from s.start_date) <= 2021 and extract(year from s.end_date) >= 2021
and st.session_id is not null