DECLARE CursorScrollable CURSOR STATIC SCROLL FOR
SELECT StudentID, Name, Grade FROM Students

DECLARE @Name VARCHAR(100), @Grade INT, @StudentID INT;
OPEN CursorScrollable;


FETCH NEXT FROM CursorScrollable INTO @StudentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0
BEGIN 
	PRINT 'Student Name: ' + @Name + '  Grade: ' + CAST(@Grade AS VARCHAR); 

	FETCH NEXT FROM CursorScrollable INTO @StudentID, @Name, @Grade;
END

FETCH PRIOR FROM CursorScrollable INTO @StudentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0
BEGIN 
	
	PRINT 'Student Name: ' + @Name + '  Grade: ' + CAST(@Grade AS VARCHAR); 
	

	FETCH PRIOR FROM CursorScrollable INTO @StudentID, @Name, @Grade;

END
CLOSE CursorScrollable;

DEALLOCATE CursorScrollable;
