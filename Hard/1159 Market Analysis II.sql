WITH t AS 
(SELECT a.seller_id, 
    CASE WHEN u.favorite_brand = item_brand THEN 'yes' 
        ELSE 'no' END AS '2nd_item_fav_brand'
FROM Users u LEFT JOIN
    (SELECT seller_id, item_brand,
    RANK() OVER(PARTITION BY seller_id ORDER BY order_date) rk
    FROM Orders o JOIN Items i USING(item_id)) a 
ON u.user_id = a.seller_id
WHERE a.rk = 2)

SELECT u.user_id seller_id, 
COALESCE(t.2nd_item_fav_brand, 'no') 2nd_item_fav_brand
FROM Users u LEFT JOIN t ON u.user_id = t.seller_id;