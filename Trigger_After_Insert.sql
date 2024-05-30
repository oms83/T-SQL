
CREATE TABLE StudentInsertLog
(
	LogID INT IDENTITY PRIMARY KEY,
	StudentID INT,
	Name VARCHAR(100),
	Subject VARCHAR(100),
	Grade INT,
	InsertedDataTime DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER trg_AfterInsertStudent ON Students
AFTER INSERT
AS 
BEGIN
	
	INSERT INTO StudentInsertLog (StudentID, Name, Subject, Grade)
	SELECT StudentID, Name, Subject, Grade FROM inserted;

END;

SELECT * FROM Students;

INSERT 
  INTO StudentInsertLog (StudentID, Name, Subject, Grade) 
VALUES (10, 'Omer', 'Turkish', 100);

SELECT * FROM StudentInsertLog;


/*
CREATE TRIGGER trg_AfterInsertStudent: Declares a new trigger named trg_AfterInsertStudent.

ON Students: Specifies that the trigger is associated with the 'Students' table.

AFTER INSERT: Indicates that the trigger responds to insert operations.

INSERT INTO StudentInsertLog(...) SELECT ... FROM inserted: The core action, which inserts a record into the 'StudentInsertLog' table. 
The inserted table is a special table used within the scope of insert and update triggers, holding the newly inserted rows.
*/
