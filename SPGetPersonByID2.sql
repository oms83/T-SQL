CREATE PROCEDURE SP_GetPersonByID2
    @PersonID INT,
    @FirstName NVARCHAR(100) OUTPUT,
    @LastName NVARCHAR(100) OUTPUT,
    @Email NVARCHAR(255) OUTPUT,
    @IsFound BIT OUTPUT  -- Additional parameter to indicate if a record was found
AS
BEGIN
    IF EXISTS(SELECT 1 FROM People WHERE PersonID = @PersonID)
    BEGIN
        SELECT 
            @FirstName = FirstName, 
            @LastName = LastName, 
            @Email = Email
        FROM People 
        WHERE PersonID = @PersonID;


        SET @IsFound = 1;  -- Set to 1 (true) if a record is found
    END
    ELSE
    BEGIN
        SET @IsFound = 0;  -- Set to 0 (false) if no record is found
    END
END



      

DECLARE @FName VARCHAR(100);
DECLARE @LName VARCHAR(100);
DECLARE @Mail VARCHAR(100);
DECLARE @Found VARCHAR(100);
DECLARE @ID INT = 1;


EXEC SP_GetPersonByID2
	@PersonID = @ID,
	@FirstName = @FName OUTPUT,
	@LastName = @LName OUTPUT,
	@Email = @Mail OUTPUT,
	@IsFound = @Found OUTPUT

IF @Found = 1
	SELECT @FName as FirstName, @LName as LastName, @Mail as Email;
ELSE
    PRINT 'Person not found';
