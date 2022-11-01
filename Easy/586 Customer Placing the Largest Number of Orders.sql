SELECT customer_number FROM Orders 
GROUP BY customer_number 
HAVING COUNT(*) = (SELECT MAX(counts) 
                   FROM (SELECT COUNT(*) counts FROM Orders
                         GROUP BY customer_number) sub);
                         
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;