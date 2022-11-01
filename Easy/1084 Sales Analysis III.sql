SELECT s.product_id, p.product_name FROM Sales s
JOIN Product p
USING(product_id)
GROUP BY s.product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';

SELECT DISTINCT p.product_id, p.product_name
FROM Sales s JOIN Product p 
USING(product_id)
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND s.product_id NOT IN 
(SELECT product_id FROM Sales 
 WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31');

SELECT p.product_id, p.product_name
FROM Sales s JOIN Product p USING(product_id)
WHERE s.product_id NOT IN 
(SELECT product_id FROM Sales 
 WHERE sale_date NOT BETWEEN ""2019-01-01"" AND ""2019-03-31"")
GROUP BY p.product_id;