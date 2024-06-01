--
SELECT * FROM Students WHERE StudentID = 1;


--
SELECT * FROM Students WHERE StudentID = 1 OR 1=1;


--
DECLARE @input NVARCHAR(50) = '1 OR 1=1';
DECLARE @SQL NVARCHAR(MAX);

SET @SQL = N'SELECT * FROM Students WHERE StudentID = ' + @input;
EXECUTE(@SQL)


-- ERROR Static Sql, Parameterized Query
DECLARE @input NVARCHAR(50) = '1 OR 1=1';

SELECT * FROM Students WHERE StudentID = @input;


-- Vaidation
DECLARE @input NVARCHAR(50) = '1 OR 1=1';

IF ISNUMERIC(@input) = 1
BEGIN 
	DECLARE @SQL NVARCHAR(MAX);
	SET @SQL = N'SELECT * FROM Students WHERE StudentID = ' + @input;
	EXECUTE(@SQL)
END
ELSE
BEGIN 
	PRINT 'Invalid Input'
	--SELECT 'Invalid input';
END

/*

What is dynamic SQL?
SQL statements that are constructed and executed at runtime as strings

Which method can be used to generate and execute dynamic SQL using a stored procedure?
EXECUTE statement
sp_executesql system stored procedure

Which function is used to safely escape a table name in dynamic SQL?
QUOTENAME

Why is dynamic SQL harder to debug and maintain compared to static SQL?
The actual SQL executed is constructed at runtime

Which of the following best describes SQL injection?
A security vulnerability that occurs when an attacker manipulates user input to execute unintended SQL statements


What is the risk of SQL injection?
Unauthorized data access

Which is a preventive measure against SQL injection?
Parameterized queries


*/
