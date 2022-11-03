SELECT seat_id FROM
(SELECT *, LAG(free) OVER () prev, LEAD(free) OVER () next
FROM Cinema) a
WHERE (a.free = 1 AND a.next = 1) OR (a.prev = 1 AND a.free = 1)
ORDER BY seat_id;

SELECT DISTINCT a.seat_id
FROM Cinema a JOIN Cinema b
ON ABS(a.seat_id - b.seat_id) = 1 AND a.free = 1 AND b.free = 1
ORDER BY a.seat_id;