-- Last updated: 29/04/2026, 23:02:18
with prime as 
(
   select
      *,
      sum(square_footage) over (
   order by
      square_footage) as running_total 
   from
      inventory 
   where
      item_type = 'prime_eligible' 
)
,
non_prime as 
(
   select
      *,
      sum(square_footage) over (
   order by
      square_footage) as running_total 
   from
      inventory 
   where
      item_type = 'not_prime' 
)
,
total_prime as 
(
   select
      'prime_eligible' as item_type,
      floor(500000 / max(running_total)) * max(running_total) as total_square,
      floor(500000 / max(running_total)) * count(*) as item_count 
   from
      prime
)
select
   'not_prime' as item_type,
   floor((500000 - (
   select
      total_square 
   from
      total_prime)) / floor(max(running_total))) * count(*) as item_count 
   from
      non_prime 
   union
   select
      item_type,
      item_count 
   from
      total_prime 
   order by
      2 desc