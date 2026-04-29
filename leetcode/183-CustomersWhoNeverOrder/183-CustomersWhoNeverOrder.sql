-- Last updated: 29/04/2026, 23:11:51
select name as customers from customers
where id not in (select customerid from orders)