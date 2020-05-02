CREATE DATABASE RCPartsPlus;
GO

USE RCPartsPlus;
CREATE TABLE Inventory(
	PartNumber int NOT NULL,
	Weight int NOT NULL,
	PartName varchar(100) NOT NULL,
	ShippingMode varchar(10),
	Price money,
	PRIMARY KEY(PartNumber)
);
GO
CREATE TABLE CustomerInfo(
	AccountID int NOT NULL,
	NameFirst varchar(20) NOT NULL,
	NameLast varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Address varchar(30)
	PRIMARY KEY(AccountID)
);

GO
CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)
);
GO
CREATE TABLE ShippingDetails(
	ID int NOT NULL,
	Name varchar(20) NOT NULL,
	ShippingMode varchar(10) NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Invoice(
	InvoiceID int NOT NULL,
	OrderDate datetime,
	AccountID int NOT NULL,
	ShipID int NOT NULL,
	OrderTotal money,
	PRIMARY KEY(InvoiceID)
);
GO
CREATE TABLE OrderDetails(
	InvoiceID int NOT NULL,
	OrderNumber int NOT NULL,
	PartNumber int NOT NULL,
	NumberOfItems int,
	PRIMARY KEY(InvoiceID)
);
GO