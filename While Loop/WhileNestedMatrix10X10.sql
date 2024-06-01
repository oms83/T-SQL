
DECLARE @col INT;
DECLARE @rowString VARCHAR(255);
DECLARE @headerString VARCHAR(255);
DECLARE @row INT = 1;

SET @headerString = CHAR(9);
SET @col = 1;

WHILE @col  <= 10 
BEGIN 
	SET @headerString = @headerString + CAST(@col AS VARCHAR) + CHAR(9);
	SET @col = @col + 1;
END
PRINT @headerString;


SET @col = 1;


WHILE @row <= 10
BEGIN 

	SET @col = 1;
	SET @rowString = CAST(@row AS VARCHAR) + CHAR(9);

	WHILE @col <= 10
	BEGIN 
		SET @rowString = @rowString + CAST(@row*@col AS VARCHAR) + CHAR(9);
		SET @col = @col + 1;
	END

	PRINT @rowString;
	SET @row = @row + 1;
END


