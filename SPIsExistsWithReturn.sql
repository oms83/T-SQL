CREATE PROCEDURE SP_ISPersonExists
	@PersonID INT
AS 
BEGIN
	IF EXISTS(SELECT 1 FROM People WHERE PersonID = @PersonID)
	BEGIN
		RETURN 1;
	END

	ELSE
	BEGIN
		RETURN 0;
	END
END

DECLARE @result BIT;
EXEC @result = SP_ISPersonExists @PersonID = 1;

IF @result = 1
	PRINT 'Person is exist';
ELSE
	PRINT 'Person is not exist';
