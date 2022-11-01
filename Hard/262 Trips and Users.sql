SELECT request_at Day, 
    ROUND(SUM(t.Status != ""completed"") / COUNT(*), 2) 'Cancellation Rate'
FROM Trips t 
JOIN Users u1 ON t.Client_ID = u1.Users_ID AND u1.Banned = ""No""
JOIN Users u2 ON t.Driver_ID = u2.Users_ID AND u2.Banned = ""No""
WHERE Request_at BETWEEN ""2013-10-01"" AND ""2013-10-03""
GROUP BY request_at;

SELECT request_at Day, 
       ROUND((COUNT(IF(t.status != 'completed', TRUE, null)) / COUNT(*)), 2) 'Cancellation Rate'
FROM Trips t 
WHERE t.Client_Id IN (Select users_id FROM Users WHERE banned = 'No') 
AND t.Driver_Id IN (Select users_id FROM Users WHERE banned = 'No')
AND t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;