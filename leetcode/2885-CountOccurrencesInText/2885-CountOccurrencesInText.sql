-- Last updated: 29/04/2026, 23:02:41
# Write your MySQL query statement below
SELECT 'bull' AS word, SUM(content LIKE '% bull %') AS count
FROM Files
UNION ALL
SELECT 'bear' AS word, SUM(content LIKE '% bear %') AS count
FROM Files