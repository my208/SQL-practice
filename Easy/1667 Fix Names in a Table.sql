SELECT user_id, 
CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LENGTH(name) - 1))) name
FROM Users
ORDER BY user_id;

SELECT user_id, 
CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTR(name, 2))) name
FROM Users
ORDER BY user_id;