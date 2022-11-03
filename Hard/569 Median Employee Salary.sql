SELECT id, company, salary
FROM
(SELECT *, 
 ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) rk,
 COUNT(*) OVER (PARTITION BY company) ct
FROM Employee) e
WHERE 
CASE WHEN MOD(ct, 2) = 0 THEN rk = ct / 2 OR rk = ct / 2 + 1
ELSE rk = CEILING(ct / 2) END;