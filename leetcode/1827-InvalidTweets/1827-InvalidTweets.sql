-- Last updated: 29/04/2026, 23:05:12
select
tweet_id
from
tweets
where length(content) > 15
