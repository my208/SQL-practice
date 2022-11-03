WITH a AS (
    SELECT num,
           SUM(frequency) OVER (ORDER BY num) - frequency AS lower_num,
           SUM(frequency) OVER (ORDER BY num) AS upper_num,
           SUM(frequency) OVER () / 2 AS medium_num
    FROM Numbers 
)

SELECT AVG(num) median
FROM a
WHERE medium_num BETWEEN lower_num AND upper_num;

-- Method 2: (hard to understand)
SELECT AVG(n.num) median
FROM Numbers n
WHERE n.frequency >= ABS((SELECT SUM(frequency) FROM Numbers WHERE num <= n.num) -
                         (SELECT SUM(frequency) FROM Numbers WHERE num >= n.num))