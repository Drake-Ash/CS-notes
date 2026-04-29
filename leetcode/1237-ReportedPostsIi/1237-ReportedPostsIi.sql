-- Last updated: 29/04/2026, 23:07:31
# Write your MySQL query statement below
with cte as (
select action_date, count(distinct r.post_id)/count(distinct a.post_id) as daily_percentage from Actions a 
left join Removals r on a.post_id = r.post_id
where a.extra = 'spam'
group by a.action_date)

select round(avg(daily_percentage)*100,2) as average_daily_percent from cte