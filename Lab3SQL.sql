#Lab3

#Use classicmodels:
#From the orderdetails table, list the total amount and the number of different types of product in each order.
#Not sure what total is wanted so just gave both
SELECT orderNumber, SUM(quantityOrdered) TotalQuantity, ROUND(SUM(priceEach),2) AS TotalPrice, Count(productCode) AS NoDiffTypes 
FROM orderdetails 
GROUP BY orderNumber;
#List the count of the orders shipped for each customer. Order by times of order from highest to lowest.
SELECT customerNumber, Count(orderNumber) As ordersCount from orders GROUP BY customerNumber Order by COUNT(orderNumber) DESC;
#Count the number of shipped orders made by customer 350
SELECT COUNT(orderNumber) AS "NoOfOrders" 
FROM orders 
WHERE customerNumber = "350";
#List all the customers that made more shipped orders than customer 350. (this is your first nested query)
SELECT customerNumber, COUNT(orderNumber) AS "NoOfOrders" 
FROM orders 
GROUP BY customerNumber 
HAVING NoOfOrders > 
(SELECT COUNT(orderNumber) AS "NoOfOrders" 
FROM orders
WHERE customerNumber = "350");