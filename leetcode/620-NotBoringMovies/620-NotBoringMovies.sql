-- Last updated: 29/04/2026, 23:09:24
select * from Cinema
 where id % 2 = 1 and description != 'boring'
 order by rating desc