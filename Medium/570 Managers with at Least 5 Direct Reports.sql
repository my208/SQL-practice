SELECT name FROM Employee 
WHERE id IN 
(SELECT managerId FROM Employee
GROUP BY managerId
HAVING COUNT(managerId) >= 5);

SELECT e1.name
FROM Employee e1 LEFT JOIN Employee e2
ON e1.id = e2.managerId 
GROUP BY e1.id
HAVING COUNT(*) >= 5; 