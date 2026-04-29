-- Last updated: 29/04/2026, 23:11:56
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores