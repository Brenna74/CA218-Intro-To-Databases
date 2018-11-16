#Lab 5
#Use the world schema
#Using a Join, list the names and populations of the cities where English is the official language spoken.
SELECT A.Name, A.Population, B.language
FROM City A LEFT JOIN CountryLanguage B
ON A.CountryCode = B.CountryCode
WHERE language = "English";

#Using a Join, list the names and populations of each city within each country, 
#clearly showing both the names and populations of both the cities and countries. 
#Also, show the percentage of the country population each city contains.
SELECT A.Name, B.Name, A.Population AS CityPop, B.Population AS CountryPop, (A.Population/B.Population)*100 AS percentage 
FROM City A LEFT JOIN Country B #LEFT JOIN BECAUSE SOME COUNTRIES DO NOT HAVE CITIES AND THE QUESTION ASKS ABOUT CITIES
								#Left joins give you just the stuff on the right(country) that has a match on the left(city)
ON A.CountryCode = B.code;


#Use classicmodels.
#List the customer’s name, number, full details(WTF does full details mean? just everything?) of all orders and payment amounts of 
#customers who have spent more on an order than any order made by the customer called Signal Gift Stores.
#(Hint: Will be a join but not a natural join)

SELECT X.* FROM
(SELECT A.customerName, A.customerNumber, B.orderNumber, B.orderDate, B.requiredDate, B.shippedDate, B.comments, B.status, C.amount
From customers A INNER JOIN orders B ON A.customerNumber = B.customerNumber
INNER JOIN payments C ON B.customerNumber = C.customerNumber) AS X,

(SELECT A.customerName, A.customerNumber, B.orderNumber, B.orderDate, B.requiredDate, B.shippedDate, B.comments, B.status, MAX(C.amount)
From customers A INNER JOIN orders B ON A.customerNumber = B.customerNumber
INNER JOIN payments C ON B.customerNumber = C.customerNumber
GROUP BY customerName
HAVING MAX(C.amount) > (SELECT MIN(C.amount)
						From customers A
						INNER JOIN payments C ON A.customerNumber = C.customerNumber
                        WHERE A.customerName = "Signal Gift Stores")
) AS Y
WHERE X.customerName = Y.customerName
AND X.customerName != "Signal Gift Stores"
;

#List the customer name and the full names of the contact person from all customers who have never placed an order.
SELECT A.customerName, A.contactLastName, A.contactFirstName 
FROM customers A Left JOIN orders B
ON A.customerNumber = B.customerNumber
WHERE B.orderNumber IS NULL;
