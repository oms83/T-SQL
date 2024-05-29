-- The ROW_NUMBER() function in SQL is a window function that assigns a unique sequential integer to rows within a partition of a result set
---------------------------------
Use C21_DB1

Create Table Students
(
	StudentID Int Primary Key,
	Name Varchar(100),
	Subject Varchar(100),
	Grade Int
);

INSERT INTO Students (StudentID, Name, Subject, Grade) VALUES
(1, 'Alice', 'Math', 90),
(2, 'Bob', 'Math', 85),
(3, 'Charlie', 'Math', 78),
(4, 'Dave', 'Science', 88),
(5, 'Emma', 'Science', 92),
(6, 'Fiona', 'Science', 84),
(7, 'Grace', 'English', 75),
(8, 'Henry', 'English', 80),
(9, 'Isabella', 'English', 88);
--------------------------------

Use C21_DB1

SELECT * FROM Students ORDER BY Grade DESC;

SELECT *, ROW_NUMBER() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC
