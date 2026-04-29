-- Last updated: 29/04/2026, 23:08:11
/* Write your PL/SQL query statement below */
SELECT 
actor_id, director_id 
FROM ActorDirector 
GROUP BY 
actor_id, director_id 
HAVING COUNT(director_id) >=3 ;