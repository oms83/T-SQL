-- Error handling in T-SQL is a crucial aspect of writing robust SQL code. It allows you to gracefully handle unexpected events and errors that occur during the execution of SQL scripts. --

USE C21_DB1 

GO
CREATE TABLE Employees3
(
	EmployeeID INT PRIMARY KEY,
	Name VARCHAR(100),
	Position VARCHAR(100)
);

GO
BEGIN TRY
	INSERT INTO Employees3 (EmployeeID, Name, Position) VALUES (1, 'Omer MEMES', 'IT');
	INSERT INTO Employees3 (EmployeeID, Name, Position) VALUES (1, 'Al MEMES', 'IT');
END TRY

BEGIN CATCH
	PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH

-- An error occurred: Violation of PRIMARY KEY constraint 'PK__Employee__7AD04FF17A3550C3'. Cannot insert duplicate key in object 'dbo.Employees3'. The duplicate key value is (1).
