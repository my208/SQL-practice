SELECT u.user_id buyer_id, u.join_date, COUNT(o.order_date) orders_in_2019
FROM Users u LEFT JOIN Orders o ON o.buyer_id = u.user_id 
AND YEAR(o.order_date) = 2019
GROUP BY u.user_id;

SELECT u.user_id buyer_id, u.join_date, 
COUNT(CASE WHEN YEAR(o.order_date) = 2019 THEN 1 ELSE NULL END) orders_in_2019
FROM Users u LEFT JOIN Orders o ON o.buyer_id = u.user_id
GROUP BY u.user_id;