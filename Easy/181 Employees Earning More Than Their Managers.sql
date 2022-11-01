SELECT a.name as Employee
FROM Employee as a, Employee as b
WHERE a.managerID = b.id AND a.salary > b.salary;
SELECT a.Name Employee
FROM Employee AS a JOIN Employee AS b on a.ManagerId = b.Id
WHERE a.Salary > b.Salary;