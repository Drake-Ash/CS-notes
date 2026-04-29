-- Last updated: 29/04/2026, 23:03:38
-- Write your PostgreSQL query statement below
with words_cte as (
select distinct post_id, unnest(string_to_array(content, ' ')) as word
from posts p
),
distinct_topics as (
select distinct w.post_id, k.topic_id
from words_cte w
left join keywords k on lower(w.word) = lower(k.word)
)
select post_id , coalesce(string_agg(topic_id::varchar, ',' order by topic_id asc), 'Ambiguous!') as topic
from distinct_topics
group by post_id