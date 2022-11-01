SELECT s.buyer_id
FROM Sales s LEFT JOIN Product p ON s.product_id = p.product_id
WHERE s.product_id IN (SELECT product_id FROM Product WHERE product_name = 'S8') 
AND s.product_id NOT IN (SELECT product_id FROM Product WHERE product_name = 'iPhone');