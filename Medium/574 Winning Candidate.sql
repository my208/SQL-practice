SELECT name FROM
(SELECT c.name, v.candidateId, COUNT(v.candidateId) ct
FROM Candidate c JOIN Vote v ON c.id = v.candidateId
GROUP BY v.candidateId) t
ORDER BY t.ct DESC
LIMIT 1;