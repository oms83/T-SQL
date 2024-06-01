CREATE FUNCTION GetPerformingStudents()
RETURNS @Result TABLE
(
	SID INT, 
	SName VARCHAR(100),
	SSubject VARCHAR(100),
	SGrade INT
)
AS 
BEGIN
	INSERT INTO @Result (SID, SName, SSubject, SGrade)
	SELECT TOP 3 StudentID, Name, Subject, Grade FROM Students
	ORDER BY Grade DESC;
	RETURN;
END
	
SELECT * From GetPerformingStudents()
