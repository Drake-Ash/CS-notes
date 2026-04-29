-- Last updated: 29/04/2026, 23:06:55
# Write your MySQL query statement below
SELECT
    DISTINCT sub_id post_id,
    (
        SELECT COUNT(DISTINCT sub_id)
        FROM Submissions s2
        WHERE s1.sub_id = s2.parent_id
    ) number_of_comments
FROM Submissions s1
WHERE parent_id IS NULL
ORDER BY sub_id;