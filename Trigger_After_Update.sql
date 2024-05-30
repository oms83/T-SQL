CREATE TABLE StudentUpdateLog
(
	LogID INT PRIMARY KEY IDENTITY,
	StudentID INT,
	OldGrade INT,
	NewGrade INT,
	UpdateDate DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_AfterUpdateStudent ON Students
AFTER UPDATE
AS 
BEGIN 
  -- Check if the grade updated
	IF UPDATE(Grade)
	BEGIN
		INSERT INTO StudentUpdateLog (StudentID, OldGrade, NewGrade)
		SELECT i.StudentID, d.Grade, i.Grade FROM inserted AS i
		INNER JOIN deleted AS d ON i.StudentID = d.StudentID
	END
END;

SELECT * FROM Students WHERE StudentID = 10


UPDATE Students 
   SET Grade = 98
 WHERE StudentID = 10;

UPDATE Students 
   SET Name = 'Omer MEMES'
 WHERE StudentID = 10;
 
-- (1 row affected)
-- (1 row affected)
-- (1 row affected)

SELECT * FROM StudentUpdateLog
-- 1	10	100	98	2024-05-30 12:35:54.243

/*
  CREATE TRIGGER trg_AfterUpdateStudent: Creates a trigger named trg_AfterUpdateStudent.
  ON Students: Associates the trigger with the 'Students' table.
  AFTER UPDATE: The trigger is fired after an update operation.
  IF UPDATE(Grade): Checks if the 'Grade' column was part of the update.
  The inserted and deleted tables: Special tables where inserted contains the new values and deleted contains the old values of the updated rows.


*/
