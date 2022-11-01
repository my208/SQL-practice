SELECT a.id
FROM
(SELECT *, LAG(temperature) OVER(ORDER BY recordDate) prev
FROM Weather) a, Weather
WHERE a.temperature > a.prev AND DATEDIFF(a.recordDate, Weather.recordDate) = 1;

SELECT a.id
FROM Weather a, Weather b
WHERE a.temperature > b.temperature AND DATEDIFF(a.recordDate, b.recordDate) = 1; --(solution, slower than above)