-- ex1
begin try
	insert into Employees3 (EmployeeID, Name, Position) values (2, 'Ali MEMES', 'IT')
	insert into Employees3 (EmployeeID, Name, Position) values (2, 'Ali MEMES', 'IT')
end try
begin catch
	print 'an error occurred: ' + error_message()
end catch
/*
(1 row affected)
(0 rows affected)
an error occurred: Violation of PRIMARY KEY constraint 'PK__Employee__7AD04FF17A3550C3'. 
Cannot insert duplicate key in object 'dbo.Employees3'. The duplicate key value is (2).
*/
----------------------------------------------------------------------------------------


-- ex2
begin try
	select 1/0
end try
begin catch
	select 
		 ERROR_LINE() as ERROR_LINE
		,ERROR_MESSAGE() as ERROR_MESSAGE
		,ERROR_NUMBER() as ERROR_NUMBER
		,ERROR_PROCEDURE() as ERROR_PROCEDURE
		,ERROR_SEVERITY() as ERROR_SEVERITY

end catch
----------------------------------------------------------------------------------------


-- ex3
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
