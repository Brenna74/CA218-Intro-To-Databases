#Q1. 50 Marks (Classic Models)
#a) 
#List the code, line, name, vendor, product code and MSRP of all Classic Cars 
#from the products table by their selling price from highest to lowest.
#15 Marks


#b) 
#List the last name, location city, phone number and number of orders placed for customers who have placed 5 or more orders. 
#List them with the highest number of orders placed first.
#15 Marks


#c) 
#Using a nested select query expression:
#List the name, vendor and amount of units ordered for all products.
#List them from highest number ordered to lowest.
#15 Marks
SELECT p.productName,p.productVendor,o.quantity 
FROM products p, (SELECT productCode, SUM(quantityOrdered) AS quantity FROM orderdetails GROUP BY productCode) o 
WHERE p.productCode = o.productCode
ORDER BY quantity DESC;

#d) 
#Repeat query c) but only where the amount of units exceeds 1000. 
#5 marks
SELECT p.productName,p.productVendor,o.quantity 
FROM products p, (SELECT productCode, SUM(quantityOrdered) AS quantity FROM orderdetails GROUP BY productCode) o 
WHERE p.productCode = o.productCode
Having quantity > "1000";