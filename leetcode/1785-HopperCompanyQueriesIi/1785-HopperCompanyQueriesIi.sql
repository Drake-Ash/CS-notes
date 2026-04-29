-- Last updated: 29/04/2026, 23:05:23
# Write your MySQL query statement below

with recursive month_2020 as (
select '2020-01-31' as date, 1 as month 
union all
select LAST_DAY(date + INTERVAL 1 MONTH) , month+1
from month_2020
where month <12
)

select month, 
       ifnull(round((count( distinct ar.driver_id) *100 / count( distinct d.driver_id) ), 2),0) as working_percentage
from month_2020 m 
left join drivers d on d.join_date <= m.date and year(d.join_date)< '2021'
left join rides r on left(r.requested_at,7) = left(m.date,7)
left join AcceptedRides ar on r.ride_id = ar.ride_id
group by 1