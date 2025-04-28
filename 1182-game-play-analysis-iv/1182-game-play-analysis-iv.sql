# Write your MySQL query statement below
WITH cte AS (
    SELECT *,
        CASE 
            WHEN DATEDIFF(event_date, LAG(event_date) OVER(PARTITION BY player_id ORDER BY event_date)) = 1 
            THEN 1 ELSE 0 
        END AS consecutive,
        RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS _rank
    FROM Activity
)
SELECT ROUND(
    SUM(CASE WHEN consecutive = 1 AND _rank = 2 THEN 1 ELSE 0 END) 
    / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2
) AS fraction from cte
