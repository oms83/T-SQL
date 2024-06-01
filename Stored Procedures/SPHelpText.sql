-- Query
EXEC sp_helptext  'SP_AddNewPerson';



-- Result
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
