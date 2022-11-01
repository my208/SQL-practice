SELECT DISTINCT num AS 'ConsecutiveNums'  
FROM 
(
    SELECT 
        num, 
        id - cast(row_number() OVER (ORDER BY num, id) AS SIGNED) AS rk 
    FROM 
        logs
) diff_grp
GROUP BY num, rk
HAVING COUNT(*) > 2;

SELECT DISTINCT a.num AS ConsecutiveNums
FROM(
SELECT *,
lag(num) OVER() AS prev,
lead(num) OVER() AS next
FROM logs) a
WHERE a.num = a.prev AND a.num=a.next;

SELECT DISTINCT Num AS ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) IN (SELECT * FROM Logs) AND (Id + 2, Num) IN (SELECT * FROM Logs);