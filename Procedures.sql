/* Gabbard Project Procs */

-- Display All
USE RCPartsPlus;
GO
CREATE PROC spPartList
AS
SELECT * FROM Inventory
ORDER BY Price;
GO

EXEC spPartList;



-- Input Parameters Proc
USE RCPartsPlus;
GO
CREATE PROC spFindPart
	@PartNumber int
AS
BEGIN
	SELECT * FROM Inventory
	WHERE PartNumber = @PartNumber;
END
GO
EXEC spFindPart 326


-- One Input to Three Output
USE RCPartsPlus;
GO
CREATE PROC spInventoryColumnDraw
	@PartNumber int,
	@Price Money OUTPUT,
	@PartName varchar(50) OUTPUT,
	@Weight int OUTPUT 
AS
SELECT PartName = @PartName, Price = @Price, Weight = @Weight
FROM Inventory 
WHERE PartNumber = @PartNumber;
GO
-- Run
DECLARE @Price Money;
DECLARE @PartName nvarchar(50);
DECLARE @Weight int;
EXEC spInventoryColumnDraw, @Price OUTPUT, @PartName OUTPUT, @Weight OUTPUT;
SELECT @Price AS '37.99', @PartName AS '4-Cell Battery', @Weight AS '2';

-- Stored Proc Return Value
USE RCPartsPlus;
GO
CREATE PROC spMembers
AS
DECLARE @MemberCount int;
SELECT @MemberCount = COUNT(*)
FROM CustomerInfo 
RETURN @MemberCount;
GO

DECLARE @MemberCount int;
EXEC @MemberCount = spMembers;
PRINT 'There are ' + CONVERT(varchar, @MemberCount) + ' members in your database';
GO


/* Final Project User Defined Functions */

-- Create
USE RCPartsPlus;
GO
CREATE FUNCTION fnGetID
    (@AccountID int = '%')
    RETURNS int
BEGIN
    RETURN (SELECT AccountID FROM CustomerInfo WHERE AccountID Like @AccountID);
END; 

-- Utilize Function
GO
SELECT AccountID, NameFirst, NameLast, Zipcode, Address FROM CustomerInfo 
WHERE AccountID = dbo.fnGetID('32165%');

USE RCPartsPlus;
GO
CREATE FUNCTION fnCustomerInfo
	(@AccountID int = '%')
	RETURNS table
RETURN
	(SELECT * FROM CustomerInfo WHERE AccountID LIKE @AccountID);
GO
SELECT * FROM dbo.fnCustomerInfo('%32165%');

 /* Final Project Triggers */

 -- Create Archive via copy w/o rows
 USE RCPartsPlus;
 GO
 SELECT * INTO InvoiceArchive
 FROM Invoice
 WHERE 1=0;

 -- Update and add activity column
 ALTER TABLE InvoiceArchive
 ADD Activity varchar(50);
 GO

 -- Insert Trigger
 CREATE TRIGGER InvoiceArchive_INSERT ON Invoice
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @InvoiceID int
	DECLARE @OrderDate datetime
	DECLARE @AccountID int
	DECLARE @ShipID int
	DECLARE @OrderTotal money


    SELECT @InvoiceID =INSERTED.InvoiceID, @OrderDate = INSERTED.OrderDate, @AccountID = INSERTED.AccountID,
	@ShipID = INSERTED.ShipID, @OrderTotal = INSERTED.OrderTotal
	FROM INSERTED

    INSERT INTO InvoiceArchive VALUES(@InvoiceID, @OrderDate, @ShipID, @AccountID, @OrderTotal, 'Inserted' )
END
GO
-- Add a new row to test
INSERT INTO Invoice VALUES(689433, 2020-01-02 00:00:00.000, 78927, 6, 73.9500);
GO
-- View Archive
SELECT * FROM InvoiceArchive;
GO
 -- Drop Trigger
 CREATE TRIGGER InvoiceArchive_Delete ON Invoice
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @InvoiceID int
	DECLARE @OrderDate datetime
	DECLARE @AccountID int
	DECLARE @ShipID int
	DECLARE @OrderTotal money

    SELECT @InvoiceID =DELETED.InvoiceID, @OrderDate = DELETED.OrderDate, @AccountID = DELETED.AccountID,
	@ShipID = DELETED.ShipID, @OrderTotal = DELETED.OrderTotal
	FROM DELETED

    INSERT INTO InvoiceArchive VALUES(@InvoiceID, @OrderDate, @ShipID, @AccountID, @OrderTotal, 'Deleted' )
END
GO
-- Remove row for test
DELETE FROM Invoice WHERE InvoiceID = 689433;
GO

-- View Archive
SELECT * FROM InvoiceArchive;

GO
 -- Update Trigger
 CREATE TRIGGER InvoiceArchive_Update ON Invoice
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @InvoiceID int
	DECLARE @OrderDate datetime
	DECLARE @AccountID int
	DECLARE @ShipID int
	DECLARE @OrderTotal money


    SELECT @InvoiceID =INSERTED.InvoiceID, @OrderDate = INSERTED.OrderDate, @AccountID = INSERTED.AccountID,
	@ShipID = INSERTED.ShipID, @OrderTotal = INSERTED.OrderTotal
	FROM INSERTED

    INSERT INTO InvoiceArchive VALUES(@InvoiceID, @OrderDate, @ShipID, @AccountID, @OrderTotal, 'Updated' )
END
GO
-- New row for test/update)
INSERT INTO Invoice VALUES(689434, 2020-01-03 00:00:00.000, 78928, 6, 87.9400);
GO
UPDATE Invoice 
SET InvoiceID = '689434'
WHERE OrderDate = 2020-01-03 00:00:00.000;
GO
-- View
SELECT * FROM InvoiceArchive;