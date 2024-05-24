CREATE DATABASE C21_DB1
GO

USE C21_DB1;

CREATE TABLE Departments
(
	DepartmentID INT NOT NULL PRIMARY KEY,
	Name NVARCHAR(50)
);

INSERT INTO Departments (DepartmentID, Name) VALUES (1, 'Human Recources');
INSERT INTO Departments (DepartmentID, Name) VALUES (2, 'Marketing');
INSERT INTO Departments (DepartmentID, Name) VALUES (3, 'IT');
INSERT INTO Departments (DepartmentID, Name) VALUES (4, 'Sales');

GO

CREATE TABLE Employees
(
	EmployeeID INT PRIMARY KEY,
	Name NVARCHAR(50),
	DepartmentID INT,
	HireDate DATETIME,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (1, 'Omer MEMES', 3, '2023-03-08');
INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (2, 'Ali MEMES', 3, '2023-09-12');
INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (3, 'Musa MEMES', 4, '2023-09-09');
INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (4, 'Yusuf MEMES', 2, '2025-10-21');
INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (5, 'Osman MEMES', 2, '2023-09-03');
INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate) VALUES (6, 'Ahmed Bozkurt', 1, '2021-12-01');

-------> T-SQL


DECLARE @DepartmentID INT;
DECLARE @DepartmentName NVARCHAR(50);
DECLARE @StartDate DATETIME;
DECLARE @EndDate DATETIME;
DECLARE @TotalEmployees INT;


SET @DepartmentID = 3;
SET @StartDate = '2023-03-08';
SET @EndDate = '2023-09-12';

SELECT @DepartmentName = Name From Departments Where DepartmentID = @DepartmentID;

SELECT @TotalEmployees = COUNT(*) 
FROM Employees 
WHERE DepartmentID = @DepartmentID
AND HireDate BETWEEN @StartDate AND @EndDate;


PRINT 'Department Repot';
PRINT 'Department Name: ' + @DepartmentName;
PRINT 'Department Period: ' + CAST(@StartDate AS VARCHAR) + ' to ' + CAST(@EndDate AS VARCHAR);

-------> Output
Department Repot
Department Name: IT
Department Period: Mar  8 2023 12:00AM to Sep 12 2023 12:00AM


