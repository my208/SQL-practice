WITH a AS (SELECT *
FROM Stadium
WHERE people >= 100)

SELECT *
FROM Stadium
WHERE people >= 100
AND (((id + 1) IN (SELECT id FROM a) AND (id + 2) IN (SELECT id FROM a))
OR ((id - 1) IN (SELECT id FROM a) AND (id - 2) IN (SELECT id FROM a))
OR ((id - 1) IN (SELECT id FROM a) AND (id + 1) IN (SELECT id FROM a)))
ORDER BY visit_date;