USE C21_DB1

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Subject NVARCHAR(50)
);

INSERT INTO Teachers (TeacherID, Name, Subject) VALUES
(1, 'John Smith', 'Math'),
(2, 'Jane Doe', 'Science'),
(3, 'Emily Johnson', 'English'),
(4, 'Mark Brown', 'History'),
(5, 'Sarah Davis', 'Music');
------
-- When create a function query you should not write anything(query, command) above the otherwise else you will take an error
CREATE FUNCTION GetGradeAverage(@subject VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @gradeAverage INT;
	SELECT @gradeAverage = AVG(Grade) FROM Students
	WHERE Subject = @subject;
	Return @gradeAverage;
END
--

SELECT Name, dbo.GetGradeAverage(Subject) FROM Students
/*
Alice	84
Bob	84
Charlie	84
Dave	88
Emma	88
Fiona	88
Grace	81
Henry	81
Isabella	81
*/
