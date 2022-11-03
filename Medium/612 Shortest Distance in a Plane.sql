SELECT ROUND(SQRT(POWER((p2.x - p1.x), 2) + POWER((p2.y - p1.y), 2)), 2) shortest
FROM Point2D p1, Point2D p2 
WHERE NOT ((p1.x = p2.x) AND (p1.y = p2.y))
ORDER BY shortest
LIMIT 1;

SELECT MIN(t.shortest) shortest FROM 
(SELECT ROUND(SQRT(POWER((p2.x - p1.x), 2) + POWER((p2.y - p1.y), 2)), 2) shortest
FROM Point2D p1 CROSS JOIN Point2D p2) t
WHERE t.shortest <> 0;