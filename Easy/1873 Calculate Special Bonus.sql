SELECT employee_id, 
    CASE WHEN (employee_id % 2 = 1) AND (name NOT LIKE 'M%') THEN salary 
    ELSE 0 END bonus
FROM Employees ORDER BY employee_id;

SELECT employee_id,
    IF (employee_id %2 AND name NOT LIKE ""M%"", salary, 0) bonus
FROM Employees ORDER BY employee_id;