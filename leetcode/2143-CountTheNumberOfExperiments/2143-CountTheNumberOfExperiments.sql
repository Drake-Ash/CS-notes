-- Last updated: 29/04/2026, 23:04:08
# Write your MySQL query statement below
WITH platform_experiments AS (
    SELECT *
    FROM (
        SELECT 'Android' AS platform UNION ALL
        SELECT 'IOS' AS platform UNION ALL
        SELECT 'Web' AS platform 
        ) AS platforms 
    CROSS JOIN (
        SELECT 'Reading' AS experiment_name UNION ALL
        SELECT 'Sports' AS experiment_name UNION ALL
        SELECT 'Programming' AS experiment_name
        ) AS experiments)

SELECT pe.platform, 
       pe.experiment_name,
       COUNT(e.experiment_id) AS num_experiments
FROM platform_experiments AS pe
LEFT JOIN Experiments AS e
       ON pe.platform = e.platform
      AND pe.experiment_name = e.experiment_name
GROUP BY pe.platform, pe.experiment_name;