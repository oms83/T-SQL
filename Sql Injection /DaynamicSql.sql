--
CREATE PROCEDURE GenerateDynamicSQL1
	@TableName VARCHAR(500)
AS 
BEGIN 
	DECLARE @Sql VARCHAR(100);
	SET @Sql = 'SELECT * FROM ' + @TableName;
	EXECUTE(@Sql)
END

--
ALTER PROCEDURE GenerateDynamicSQL2
	@TableName NVARCHAR(500)
AS 
BEGIN 
	DECLARE @Sql NVARCHAR(100);
	SET @Sql = N'SELECT * FROM ' + @TableName;
	EXEC sp_executesql @Sql
END

--
ALTER PROCEDURE GenerateDynamicSQL3
	@TableName NVARCHAR(500)
AS 
BEGIN 
	DECLARE @Sql NVARCHAR(100);
	SET @Sql = N'SELECT * FROM ' + QUOTENAME(@TableName);
	EXEC sp_executesql @Sql
END

--
DECLARE @TName VARCHAR(100);
SET @TName = 'Students';

--
EXEC GenerateDynamicSQL3
	@TableName = @TName

--
EXECUTE GenerateDynamicSQL2
	@TableName = @TName
	
--
EXECUTE GenerateDynamicSQL3
	@TableName = @TName
/*
  Stored procedures in SQL Server can be used to generate and execute dynamic SQL. Dynamic SQL refers to SQL statements that are 
  constructed and executed at runtime as strings. This approach allows for a high degree of flexibility, but it also requires careful 
  handling to avoid issues such as SQL injection.

  -> sp_executesql supports parameterized queries, which can help mitigate the risk of SQL injection.
  -> The QUOTENAME function is used to safely escape the table name, providing additional protection against injection.

  # Considerations for Dynamic SQL in Stored Procedures

  -> SQL Injection: Dynamic SQL can be vulnerable to SQL injection attacks, especially if user input is concatenated directly into SQL strings.
      Always validate and sanitize user inputs.

  -> Debugging and Maintenance: Dynamic SQL can be harder to debug and maintain compared to static SQL, as the actual SQL 
      executed is constructed at runtime.

  -> Performance: While dynamic SQL offers flexibility, it may not always be as performant as static SQL, especially if it leads to 
      frequent recompilations of the SQL statements.

  -> Security: Ensure that the stored procedure and its dynamic SQL do not inadvertently elevate the privileges of the user executing it.

*/
