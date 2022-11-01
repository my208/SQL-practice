SELECT d.name Department, a.name Employee, a.salary Salary
FROM 
    (SELECT e.*, 
     DENSE_RANK() over (PARTITION BY departmentId ORDER BY salary DESC) rk
    FROM Employee e) a JOIN Department d ON d.id = a.departmentId
WHERE a.rk <= 3;