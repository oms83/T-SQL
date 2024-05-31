DECLARE CursorDynamic CURSOR FORWARD_ONLY FOR
SELECT StudentID, Name, Grade FROM Students

DECLARE @Name VARCHAR(100), @Grade INT, @StudentID INT;

OPEN CursorDynamic;

FETCH NEXT FROM CursorDynamic INTO @StudentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0
BEGIN 
	
	PRINT 'Student Name: ' + @Name + '  Grade: ' + CAST(@Grade AS VARCHAR); 
	
	FETCH NEXT FROM CursorDynamic INTO @StudentID, @Name, @Grade;

END

CLOSE CursorDynamic;

DEALLOCATE CursorDynamic;
