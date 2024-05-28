CREATE PROCEDURE SP_UpdatePersonInfo
    @PersonID INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(255)
    
AS
BEGIN
    UPDATE People 
	SET FirstName = @FirstName,
		LastName = @LastName,
		Email = @Email
	WHERE PersonID = @PersonID;
END


DECLARE @ID INT = 1;

SELECT * FROM People WHERE PersonID = @ID;

EXEC SP_UpdatePersonInfo
	@PersonID = @ID,
	@FirstName = 'OMER',
	@LastName = 'MEMES',
	@Email = 'oms83@gmail.com'

SELECT * FROM People WHERE PersonID = @ID;

