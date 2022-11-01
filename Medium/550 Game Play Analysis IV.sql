SELECT ROUND(COUNT(b.player_id) / COUNT(a.player_id), 2) fraction
FROM (SELECT player_id, MIN(event_date) first_login FROM Activity GROUP BY player_id) a LEFT JOIN Activity b
ON a.player_id = b.player_id AND a.first_login + 1 = b.event_date;

SELECT ROUND(COUNT(b.player_id) / COUNT(a.player_id), 2) fraction
FROM (SELECT player_id, MIN(event_date) first_login FROM Activity GROUP BY player_id) a LEFT JOIN Activity b
ON a.player_id = b.player_id AND DATE_SUB(a.first_login, INTERVAL -1 DAY) = b.event_date;