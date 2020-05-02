/*
USE RCPartsPlus;
SELECT Zipcode.Country, COUNT(DISTINCT CustomerInfo.AccountID) AS [Customers per Country]
FROM CustomerInfo JOIN Zipcode ON CustomerInfo.Zipcode = Zipcode.Zipcode
GROUP BY Zipcode.Country
ORDER BY Zipcode.Country ASC;
*/
/*
USE RCPartsPlus;
SELECT COUNT(OrderDetails.PartNumber) AS [Total Items Purchased], Inventory.PartName,
		SUM(OrderDetails.NumberOfItems) * Inventory.Price AS [Order Total]
FROM OrderDetails JOIN Inventory ON OrderDetails.PartNumber = Inventory.PartNumber
GROUP BY Inventory.PartName, Inventory.Price, Inventory.PartNumber
ORDER BY Inventory.PartNumber;
*/
/*
USE RCPartsPlus;
SELECT COUNT(OrderDetails.PartNumber) AS [Total Items Ordered],
		AVG(Inventory.Price) AS [Average Price Per Item]
FROM OrderDetails JOIN Inventory ON OrderDetails.PartNumber = Inventory.PartNumber;
*/

USE RCPartsPlus;
SELECT MIN(Invoice.OrderTotal) AS [Minimum Due],
		MAX(Invoice.OrderTotal) AS [Maximum Due],
		AVG(Invoice.OrderTotal) AS [Average Due]
FROM Invoice;