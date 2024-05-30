
ALTER TABLE Employees
ADD IsActive BIT DEFAULT 1;

UPDATE Employees SET IsActive = 1;

SELECT * FROM Employees;

CREATE TRIGGER trg_InsteadDeleteEmployees ON Employees
INSTEAD OF DELETE
AS 
BEGIN 
		UPDATE Employees
		   SET IsActive = 0
		  FROM Employees S
    INNER JOIN deleted D 
			ON D.EmployeeID = S.EmployeeID	
END

SELECT * FROM Employees;

DELETE FROM Employees WHERE EmployeeID = 1

/*
1	Omer MEMES	3	2023-03-08 00:00:00.000	0	0
2	Ali MEMES	3	2023-09-12 00:00:00.000	0	1
3	Musa MEMES	3	2023-09-09 00:00:00.000	0	1
4	Yusuf MEMES	2	2022-09-21 00:00:00.000	0	1
5	Osman MEMES	2	2023-09-03 00:00:00.000	0	1
6	Ahmed Bozkurt	1	2021-12-01 00:00:00.000	0	1
7	Luna	1	2023-05-02 00:00:00.000	1	1
*/
