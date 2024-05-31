DECLARE ForwardOnly CURSOR FORWARD_ONLY FOR
SELECT StudentID, Name, Grade FROM Students

DECLARE @Name VARCHAR(100), @Grade INT, @StudentID INT;

OPEN ForwardOnly;

FETCH NEXT FROM ForwardOnly INTO @StudentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0
BEGIN 
	
	PRINT 'Student Name: ' + @Name + '  Grade: ' + CAST(@Grade AS VARCHAR); 
	
	FETCH NEXT FROM ForwardOnly INTO @StudentID, @Name, @Grade;

END

CLOSE ForwardOnly;

DEALLOCATE ForwardOnly;
