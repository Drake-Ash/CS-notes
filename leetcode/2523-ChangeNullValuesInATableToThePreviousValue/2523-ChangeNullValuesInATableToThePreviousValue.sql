-- Last updated: 29/04/2026, 23:03:05
# Write your MySQL query statement below
select id,max(drink) over(partition by count order by row_num) as drink from (
select id,drink,row_num,count(drink) over(order by row_num) as count from (
select *,row_number()  over() as row_num from CoffeeShop) x) y