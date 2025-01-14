USE RCPartsPlus;

INSERT INTO CustomerInfo VALUES(32165, 'Mike', 'Guggenheimer', 50301, '111 Generic Ave.')
INSERT INTO CustomerInfo VALUES(36568, 'Alex', 'Flugenbert', 19539, '658 Nowhere St.')
INSERT INTO CustomerInfo VALUES(54684, 'Angela', 'Bowers', 15963, '987 Allstar Ct.')
INSERT INTO CustomerInfo VALUES(65489, 'Luke', 'Skywalker', 94129, '1 Letterman Dr.')
INSERT INTO CustomerInfo VALUES(68213, 'Chelsey', 'Lions', 10001, '654 Highlands Ave.')
INSERT INTO CustomerInfo VALUES(78926, 'Nick', 'Cage', 89101, '5100 Spanish Heights Dr.')
INSERT INTO CustomerInfo VALUES(98544, 'Rick', 'Sanchez', 60548, '999 Universe Blvd.')

INSERT INTO Zipcode VALUES(50301, 'IA', 'Des Moines', 'United States')
INSERT INTO Zipcode VALUES(19539, 'PA',	'Fredericksville', 'United States')
INSERT INTO Zipcode VALUES(15963, 'PA',	'Paint', 'United States')
INSERT INTO Zipcode VALUES(94129, 'CA',	'San Francisco', 'United States')
INSERT INTO Zipcode VALUES(10001, 'NY',	'New York', 'United States')
INSERT INTO Zipcode VALUES(89101, 'NV',	'Las Vegas', 'United States')
INSERT INTO Zipcode VALUES(60548, 'IL',	'Sandwich', 'United States')

INSERT INTO Inventory VALUES(326, 2,	'4-Cell Battery', 'Ground',	36.99)
INSERT INTO Inventory VALUES(365, 0.75, 'A-Motor', 'Air', 16.99)
INSERT INTO Inventory VALUES(366, 2,	'B-Motor', 'Air', 18.99)
INSERT INTO Inventory VALUES(367, 2,	'C-Motor', 'Air', 20.99)
INSERT INTO Inventory VALUES(423, 0.75, 'ESC', 'Air', 14.99)
INSERT INTO Inventory VALUES(456, 2,	'Carbon Wing-Spar', 'Air', 4.99)
INSERT INTO Inventory VALUES(654, 1,	'6-Cell Battery', 'Ground',	41.99)
INSERT INTO Inventory VALUES(684, 2,	'Servo-Harness', 'Air',	5.99)
INSERT INTO Inventory VALUES(735, 1,	'Servo', 'Air',	7.99)
INSERT INTO Inventory VALUES(746, 2,	'Sheet-Foam', 'Air', 1.99)
INSERT INTO Inventory VALUES(824, 2,	'6" Landing Gear', 'Air', 6.99)
				
INSERT INTO Invoice VALUES(651546,	'10/21/2019', 32165, 2,	31.98)
INSERT INTO Invoice VALUES(635132,	'10/28/2019', 36568, 3,	20.99)
INSERT INTO Invoice VALUES(658412,	'11/15/2019', 54684, 3,	41.99)
INSERT INTO Invoice VALUES(658123,	'11/18/2019', 65489, 1,	18.97)
INSERT INTO Invoice VALUES(653132,	'12/12/2019', 68213, 1,	51.98)
INSERT INTO Invoice VALUES(689432,	'1/1/2020',	  78926, 5,	58.96)
INSERT INTO Invoice VALUES(654132,	'1/29/2020',  98544, 4,	18.99)
				
INSERT INTO OrderDetails VALUES(651546,	6698513, 423, 2)
INSERT INTO OrderDetails VALUES(651546,	6698514, 365, 2)
INSERT INTO OrderDetails VALUES(635132,	6516516, 367, 1)
INSERT INTO OrderDetails VALUES(658412,	6543165, 654, 1)
INSERT INTO OrderDetails VALUES(658123,	6531652, 684, 2)
INSERT INTO OrderDetails VALUES(658123,	6531653, 735, 4)
INSERT INTO OrderDetails VALUES(658123,	6531654, 456, 3)
INSERT INTO OrderDetails VALUES(653132,	6541634, 423, 5)
INSERT INTO OrderDetails VALUES(653132,	6541635, 326, 2)
INSERT INTO OrderDetails VALUES(689432,	6958129, 326, 2)
INSERT INTO OrderDetails VALUES(689432,	6958130, 423, 1)
INSERT INTO OrderDetails VALUES(689432,	6958131, 456, 4)
INSERT INTO OrderDetails VALUES(689432,	6958132, 746, 4)
INSERT INTO OrderDetails VALUES(654132,	6516321, 366, 1)

INSERT INTO ShippingDetails VALUES(1,	'FedEx',	 'Ground')
INSERT INTO ShippingDetails VALUES(2,	'USPS',	     'Ground')
INSERT INTO ShippingDetails VALUES(3,	'UPS',	     'Ground')
INSERT INTO ShippingDetails VALUES(4,	'FedEx Air', 'Air')
INSERT INTO ShippingDetails VALUES(5,	'USPS Air',	 'Air')
