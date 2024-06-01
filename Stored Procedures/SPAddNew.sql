CREATE TABLE People
(
	PersonID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(100),
	LastName VARCHAR(100),
	Email VARCHAR (100)
);

CREATE PROCEDURE SP_AddNewPerson
	@NewPersonID INT OUTPUT,
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Email VARCHAR(100)
AS
BEGIN
	INSERT INTO People (FirstName, LastName, Email) VALUES
					   (@FirstName, @LastName, @Email);
	
	SET @NewPersonID = SCOPE_IDENTITY();
END

DECLARE @PersonID INT;
EXEC SP_AddNewPerson
	@FirstName = 'Ali',
	@LastName = 'MEMES',
	@Email = 'ali83@gmail.com',
	@NewPersonID = @PersonID OUTPUT

SELECT @PersonID AS NewPersonID;
