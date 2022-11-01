DELETE FROM Person WHERE id NOT IN 
(SELECT * FROM (
    SELECT MIN(id) FROM Person GROUP BY Email) temp);

DELETE p2
FROM Person p1 JOIN Person p2 ON p1.email = p2.email
WHERE p1.id < p2.id; --(much slower than the first attempt)