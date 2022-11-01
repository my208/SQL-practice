SELECT s1.id, COALESCE(s2.student, s1.student) AS student
FROM (Seat s1 LEFT JOIN Seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id)
ORDER BY s1.id;

SELECT s1.id, s2.student
FROM Seat s1, Seat s2
WHERE (CASE WHEN s1.id % 2 = 1 AND s1.id = (SELECT MAX(id) FROM Seat) THEN s1.id = s2.id
      WHEN s1.id % 2 = 0 THEN s1.id = s2.id + 1
      ELSE s2.id = s1.id +1 
      END)
ORDER BY s1.id;

SELECT id, IFNULL(CASE WHEN id % 2 != 0 THEN lead(student) over ()  
                 ELSE lag(student) over () END, student) AS student
FROM Seat;