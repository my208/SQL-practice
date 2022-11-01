SELECT a.email Email
FROM 
    (SELECT email, count(email) num
    FROM Person
    GROUP BY email) a
WHERE a.num > 1;
SELECT email Email
FROM Person
GROUP BY email
HAVING COUNT(Email) > 1;