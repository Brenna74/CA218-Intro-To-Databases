#Lab 2

#Use world
#list all info in countrylanguage table
SELECT * FROM CountryLanguage;
#get name continent region population local name of a country
SELECT Name,Continent,Region,Population,LocalName FROM Country;

#Use sakila
#get title,description,release_year,rental_rate,of the films released in 2006
SELECT title,description,release_year,rental_rate 
FROM film 
WHERE release_year = "2006";
#list customer_id,inventory_id who borrowed a film from staff with id = 1
SELECT customer_id, inventory_id,staff_id 
FROM rental 
WHERE staff_id = "1";

#Use classicmodels:
#Get detailed information of a product which has over than 5000 of qualityInStock and MSRP is twice bigger than buyPrice. 
#Order the results by product name in alphabetical order.
SELECT * 
FROM products 
WHERE quantityInStock > "5000" AND MSRP > buyPrice*2 
ORDER BY productName;
#From payments table, list customers who spent more than 30000 in total,
#order the result by thetotal amount from highest to lowest.
SELECT customerNumber, ROUND(SUM(amount),2) 
FROM payments 
GROUP BY customerNumber 
HAVING (ROUND(SUM(amount),2)) > 30000 
ORDER BY ROUND(SUM(amount),2);