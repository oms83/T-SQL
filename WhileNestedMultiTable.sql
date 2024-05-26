USE C21_DB1

DECLARE @x INT = 1;
DECLARE @y INT = 1;

WHILE @x <= 10
BEGIN 
	SET @y = 1;
	WHILE @y <= 10
	BEGIN
		PRINT CAST(@x AS VARCHAR) + '*' + CAST(@y AS VARCHAR) + '=' + CAST(@x*@y AS VARCHAR);
		SET @y = @y + 1;
	END
	PRINT '';
	SET @x = @x + 1;
END

