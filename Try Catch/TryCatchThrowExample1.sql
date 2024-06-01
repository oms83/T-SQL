-- Used to raise an exception and transfer control to a CATCH block of a TRY...CATCH construct in your SQL code.
-- THROW [error_number, message, state];

-- error_number: A constant or variable between 50000 and 2147483647.
-- message: The error message text. It should be a string less than 2048 characters.
-- state: A constant or variable between 0 and 255.

USE C21_DB1

Create Table Products1
(
	ProductID INT PRIMARY KEY,
	StockQuantity INT
);

Insert Into Products1 (ProductID, StockQuantity) Values (1, 700);
Insert Into Products1 (ProductID, StockQuantity) Values (2, 50);
Insert Into Products1 (ProductID, StockQuantity) Values (3, 100);

Declare @NewStockQuantity INT = -5;

BEGIN TRY

	If @NewStockQuantity < 0 
		THROW 51000, 'Stock quantity cannot be negative', 1
	
	Update Products1 SET StockQuantity = @NewStockQuantity WHERE ProductID = 1;

END TRY 

BEGIN CATCH

	SELECT 
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_MESSAGE() AS ErrorMassage,
		ERROR_STATE() AS ErrorState
END CATCH 

