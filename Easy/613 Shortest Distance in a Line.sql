SELECT MIN(t.shortest) shortest FROM
(SELECT ABS(p1.x-p2.x) shortest
FROM Point p1 CROSS JOIN Point p2) t
WHERE t.shortest <> 0;

SELECT ABS(p1.x-p2.x) shortest
FROM Point p1 JOIN Point p2 ON p1.x <> p2.x
ORDER BY shortest
LIMIT 1;