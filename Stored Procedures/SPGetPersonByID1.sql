CREATE PROCEDURE SP_GetPersonByID1
	@PersonID INT 
AS 
BEGIN 
	SELECT * FROM People WHERE PersonID = @PersonID;
END


EXEC SP_GetPersonByID1
	@PersonID = 1
