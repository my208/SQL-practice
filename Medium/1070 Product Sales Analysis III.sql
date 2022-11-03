SELECT product_id, year first_year, quantity, price
FROM 
(SELECT *, RANK() OVER (PARTITION BY product_id ORDER BY year) rk
FROM Sales) s
WHERE rk = 1;

SELECT product_id, year first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
SELECT product_id, MIN(year) myr
FROM Sales GROUP BY product_id);