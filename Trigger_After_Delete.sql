
CREATE TABLE StudentDeleteLog
(
	LogID INT IDENTITY PRIMARY KEY,
	StudentID INT,
	Name VARCHAR(100),
	Subject VARCHAR(100),
	Grade INT,
	InsertedDataTime DATETIME DEFAULT GETDATE()
);


--
CREATE TRIGGER trg_AfterStudentDelete ON Students
AFTER DELETE
AS
BEGIN 
	INSERT INTO StudentDeleteLog (StudentID, Name, Subject, Grade)
	SELECT StudentID, Name, Subject, Grade FROM deleted;
END

  
--
DELETE
  FROM Students 
 WHERE StudentID = 9;

-- (1 row affected)
-- (1 row affected)

--
SELECT * FROM Students;


--
SELECT * FROM StudentDeleteLog;
-- 1	9	Isabella	English	88	2024-05-30 12:59:46.480

/*
What is an After Delete Trigger?
A special kind of stored procedure that automatically executes after a DELETE operation

What does the StudentDeleteLog table store?
Information about each deleted student record

When does the trg_AfterDeleteStudent trigger execute?
After a DELETE operation
*/
