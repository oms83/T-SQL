DECLARE @x INT;
DECLARE @y INT;
SET @x = 1;
SET @y = 0;
WHILE @x <= 10
BEGIN 
	PRINT @x
	IF @x = 5
	BEGIN
		BREAK
	END
	SET @x = @x + 1
END

PRINT ''
PRINT 'Even Numbers:'
WHILE @y <= 10
BEGIN
	SET @y = @y + 1
	IF @y % 2 != 0
	BEGIN 
		CONTINUE
	END 
	PRINT @y
END
