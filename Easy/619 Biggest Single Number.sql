SELECT (CASE WHEN COUNT(*) = 0 THEN NULL 
        ELSE t.num END) AS num 
FROM (SELECT *, COUNT(*) ct FROM MyNumbers 
      GROUP BY num HAVING ct = 1
      ORDER BY num DESC LIMIT 1) t;

SELECT MAX(t.num) num 
FROM (SELECT *, COUNT(*) ct FROM MyNumbers 
      GROUP BY num HAVING ct = 1
      ORDER BY num DESC) t;

SELECT (SELECT num ct FROM MyNumbers 
      GROUP BY num HAVING COUNT(*) = 1
      ORDER BY num DESC LIMIT 1) num;