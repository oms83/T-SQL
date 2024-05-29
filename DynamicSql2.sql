CREATE PROCEDURE GenerateDynamicSql4
	@TableName VARCHAR(100)
AS 
BEGIN 
	DECLARE @SQL NVARCHAR(100);
	SET @SQL = 'SELECT * FROM ' + QUOTENAME(@TableName);
	EXEC sp_executesql @SQL;
END

DECLARE @TN VARCHAR(100) = 'Students'
EXEC GenerateDynamicSql4
	@TableName = @TN
