CREATE TABLE StudentInfo
(
	StudentID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(100),
	Address VARCHAR(500),
);

CREATE TABLE AcademicInfo
(
	StudentID INT,
	Course VARCHAR(100),
	Grade INT,
	FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
);

--ALTER TABLE AcademicInfo
--ALTER COLUMN StudentID INT 

--DROP TABLE AcademicInfo
--DROP TABLE StudentInfo

INSERT INTO AcademicInfo (StudentID, Course, Grade) VALUES
(1, 'Computer Science', 90),
(2, 'Mathematics', 85);

INSERT INTO StudentInfo (Name, Address) VALUES
('John Doe', '123 Main St'),
('Jane Smith', '456 Oak Ave');
------------------------------------------------------------


CREATE VIEW StudentView AS
SELECT P.StudentID, P.Name, P.Address, A.Course, A.Grade
FROM StudentInfo P
JOIN AcademicInfo A ON P.StudentID = A.StudentID;
------------------------------------------------------------


CREATE TRIGGER trg_InsteadUpdateStudent ON StudentView
INSTEAD OF UPDATE
AS 
BEGIN 
		UPDATE StudentInfo 
		SET Name = I.Name, Address = I.Address 
		FROM  StudentInfo S
		INNER JOIN inserted I ON S.StudentID = I.StudentID

		UPDATE AcademicInfo 
		SET Grade = I.Grade, Course	 = I.Course
		FROM  AcademicInfo A
		INNER JOIN inserted I ON A.StudentID = I.StudentID

END


SELECT * FROM StudentView;

UPDATE StudentView
SET Grade = 100, Name = 'Omer MEMES'
WHERE StudentID = 1
--(1 row affected)
--(1 row affected)
--(1 row affected)
------------------------------------------------------------

/*
What is the purpose of the StudentView?
To provide a complete profile of each student

Why can't an 'After Update' trigger be used effectively for updating the StudentView?
The StudentView is not directly updateable
The StudentView is based on multiple tables

What is the solution for updating the StudentView?
Using an 'Instead Of Update' trigger

What is the purpose of the Instead Of Update trigger?
To distribute the changes to the underlying tables
*/



