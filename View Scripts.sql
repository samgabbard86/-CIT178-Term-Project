/* Final Project Views */

USE RCPartsPlus;
GO

/*  Look #1  */

-- Editable --
CREATE VIEW InventoryView
AS
SELECT PartNumber, Weight, PartName, GroundOnly, Price
FROM Inventory;
GO

--Original Data--
SELECT * FROM InventoryView;

-- New Price for Item --

GO
UPDATE InventoryView
SET Price = 37.99
WHERE PartNumber=326;
GO

-- New Data Check --

SELECT * FROM InventoryView;


/*  Look #2  */

-- Creation View --
GO
CREATE VIEW InvoiceDetails
AS
SELECT Invoice.InvoiceID, AccountID, ShipID, OrderTotal, OrderDate
FROM OrderDetails JOIN Invoice ON OrderDetails.InvoiceID = Invoice.InvoiceID;
GO

-- Data Check --
SELECT * FROM InvoiceDetails;

/* Look #3 */

-- Creation View --
GO
CREATE VIEW InvoiceDate
AS
SELECT InvoiceID, OrderDate, AccountID, ShipID, OrderTotal FROM Invoice
WHERE GETDATE()>OrderDate AND OrderTotal > 20;
GO

-- Data Check --
SELECT * FROM InvoiceDate;

/* Look #4 */

-- Creation View --
GO
CREATE VIEW CustomerInfoView
AS
SELECT AccountID, NameFirst, NameLast, Zipcode, Address FROM CustomerInfo;
GO

-- Data Check --
SELECT * FROM CustomerInfoView;
