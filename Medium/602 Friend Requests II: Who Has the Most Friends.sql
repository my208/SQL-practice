SELECT id, COUNT(*) num FROM 
(SELECT requester_id id FROM RequestAccepted r1
UNION ALL
SELECT accepter_id id FROM RequestAccepted r2) temp
GROUP BY id ORDER BY num DESC LIMIT 1;