-- Last updated: 29/04/2026, 23:02:43
WITH two_way_friendships AS (
  SELECT F1.user1, F1.user2 FROM Friends F1
  UNION ALL
  SELECT F2.user2, F2.user1 FROM Friends F2
)
SELECT
  T.user1,
  ROUND(
    100 * (
      COUNT(DISTINCT T.user2) / (COUNT(T.user1) OVER ())
  ), 2) AS percentage_popularity
FROM
  two_way_friendships T
GROUP BY
  T.user1
ORDER BY
  T.user1;