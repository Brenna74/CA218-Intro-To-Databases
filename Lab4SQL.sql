#Lab4

#Use classicmodels:
#List the full details of any product whose buyPrice is greater than the average buyPrice, 
#and show by how much their buyPrice is greater than the average.
#Order the difference from the highest to lowest.
SELECT *, ROUND(buyPrice - (SELECT ROUND(AVG(buyPrice),2) FROM products),2) AS "Diff" FROM products 
where (buyPrice) > (SELECT ROUND(AVG(buyPrice),2) FROM products)
ORDER BY Diff DESC;
#SOME PRODUCTS WERE ABOVE AVERAGE BY LESS THAN A CENT. THEYRE EXCLUDED HERE, TO INCLUDE THEM REMOVE EITHER JUST THE LAST ROUND OR ALL ROUNDS

#List out the products with a profit greater than the average profit for all products. 
#Order the products by the profit multiplied by stock levels. (Hint: The profit for each product is MSPRbuyPrice)
SELECT *, ROUND((MSRP - buyPrice),2) AS Profit, ROUND((MSRP - buyPrice),2)*quantityInStock AS TotalProfit
FROM products
WHERE ROUND((MSRP - buyPrice),2) > (SELECT AVG(MSRP - buyPrice) FROM products)
ORDER BY TotalProfit ASC;

#List out all customers who meet the following criteria:
#have a creditLimit greater than any customers who live in Austria
#have more than one salesRepEmployee in their country
SELECT B.* 
FROM 
(
SELECT customerNumber,customerName,country,creditLimit,salesRepEmployeeNumber 
FROM customers
HAVING creditLimit > (SELECT MAX(creditLimit) From customers WHERE country = "Austria")
ORDER BY country
) AS B,
(
SELECT country
FROM customers
GROUP BY country
HAVING (SELECT count(distinct salesRepEmployeeNumber)) > 1
) AS A
WHERE A.country = B.country
;

#List all customers from any country where all the customers in that country have a creditLimit
#greater than any customers living in Austria. (Hint: try using min() and max())
SELECT B.* FROM
(SELECT * FROM customers) AS B,
(SELECT country 
FROM customers 
GROUP BY country
HAVING MIN(creditLimit) > (SELECT MAX(creditLimit) FROM customers WHERE country = "Austria")
)AS A
WHERE B.country = A.country;
