USE C21_DB1

DECLARE @MaxID INT;
DECLARE @MinID INT;
DECLARE @EmployeeID INT;
DECLARE @Name VARCHAR(50);

SELECT @MinID = MIN(EmployeeID) FROM Employees;
SELECT @MaxID = MAX(EmployeeID) FROM Employees;
SET @EmployeeID = @MinID;

WHILE @EmployeeID IS NOT NULL AND @EmployeeID <= @MaxID
BEGIN
	SELECT @Name = Name FROM Employees WHERE @EmployeeID = EmployeeID;
	PRINT @Name;
	SELECT @EmployeeID = MIN(EmployeeID) FROM Employees WHERE @EmployeeID < EmployeeID;
END
