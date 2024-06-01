CREATE TRIGGER trg_InsteadInsertStudent On StudentView
INSTEAD OF INSERT
AS 
BEGIN
	INSERT INTO StudentInfo (Name, Address) 
	SELECT Name, Address FROM inserted;

	INSERT INTO AcademicInfo (StudentID, Grade, Course) 
	SELECT StudentID, Grade, Course FROM inserted;
END

INSERT INTO StudentView (StudentID, Name, Address, Course, Grade)
VALUES (3, 'Alice Johnson', '789 Pine Rd', 'Physics', 88);

SELECT * FROM StudentView;

/*

1	OMER MEMES	123 Main St	Computer Science	100
2	Jane Smith	456 Oak Ave	Mathematics	85
3	Alice Johnson	789 Pine Rd	Physics	88

*/
