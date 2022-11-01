SELECT a.seller_id
FROM
(SELECT seller_id, DENSE_RANK() OVER(ORDER BY SUM(price) DESC) rk
FROM Sales
GROUP BY seller_id) a
WHERE a.rk = 1;