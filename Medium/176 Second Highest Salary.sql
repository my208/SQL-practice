SELECT 
(SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1) AS SecondHighestSalary;

/* SELECT MAX(salary) AS 'SecondHighestSalary'
FROM Employee
WHERE salary != (Select MAX(salary) FROM employee); */