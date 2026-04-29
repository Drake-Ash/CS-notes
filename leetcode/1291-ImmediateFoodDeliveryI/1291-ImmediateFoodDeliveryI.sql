-- Last updated: 29/04/2026, 23:07:20
select
round((select count(*) from Delivery where order_date = customer_pref_delivery_date) / 
(select count(*) from Delivery)*100,2)
as immediate_percentage