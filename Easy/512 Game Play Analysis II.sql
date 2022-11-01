SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN
    (SELECT player_id, MIN(event_date)
    FROM Activity 
    GROUP BY player_id);

SELECT DISTINCT player_id, FIRST_VALUE(device_id) 
OVER (PARTITION BY player_id ORDER BY event_date) device_id
FROM activity;