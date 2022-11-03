SELECT e.name, b.bonus
FROM Employee e LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

SELECT name, bonus
FROM Employee LEFT JOIN Bonus USING(empId)
WHERE COALESCE(bonus, 0) < 1000;