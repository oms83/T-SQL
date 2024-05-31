DECLARE StaticCursor CURSOR STATIC FOR
SELECT StudentID, Name, Grade FROM Students

OPEN StaticCursor;

DECLARE @studentID INT, @Name VARCHAR(100), @Grade INT;

FETCH NEXT FROM StaticCursor INTO @studentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Student Name: ' + @Name + '  Grade: ' + CAST(@Grade AS VARCHAR); 

	FETCH NEXT FROM StaticCursor INTO @studentID, @Name, @Grade;
END

close StaticCursor;


--What is the purpose of static cursors in T-SQL?
--To create a fixed snapshot of the data at the time the cursor is opened

--When are static cursors particularly useful?
--When you need a consistent set of data throughout the cursor's life

--What is an advantage of static cursors?
--Ensures the data being processed doesn't change during cursor operations
--Requires fewer locks on the data

--What is a disadvantage of static cursors?
--Requires more memory usage

--When should a set-based operation be considered instead of using cursors?
--Always evaluate if a set-based operation can be used before opting for cursors
