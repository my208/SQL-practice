SELECT c.name Customers
FROM Customers c LEFT JOIN Orders o ON c.id = o.customerID
WHERE o.id IS NULL;
select customers.name as 'Customers'
from customers
where customers.id not in (select customerid from orders);