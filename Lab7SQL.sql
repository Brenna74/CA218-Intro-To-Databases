#Q1 C
SELECT p.productCode,p.productName,p.productVendor,o.quantity 
FROM products p, (SELECT productCode, SUM(quantityOrdered) AS quantity FROM orderdetails GROUP BY productCode) o 
WHERE p.productCode = o.productCode;