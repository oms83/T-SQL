----------------------------------------------------------------
--- Example 1
USE C21_DB1

ALTER TABLE Employees
ADD Gender BIT;

UPDATE Employees 
SET Gender = 0

SELECT * FROM Employees

INSERT INTO Employees (EmployeeID, NAME, DepartmentID, HireDate, Gender)
			VALUES    (7, 'Luna', 1, '2023-05-02', 1);

SELECT EmployeeID, Name, 
	   Gender = 
	   CASE 
			WHEN Gender = 0 THEN 'Male'
			WHEN Gender = 1 THEN 'Female'
			ELSE 'Unkown'
	   END
FROM Employees

----------------------------------------------------------------
--- Example 2
SELECT Name, 
	   DepartmentID = 
	   CASE
			WHEN DepartmentID = 1 THEN 'Human Recources'
			WHEN DepartmentID = 2 THEN 'Marketing'
			WHEN DepartmentID = 3 THEN 'IT'
			WHEN DepartmentID = 4 THEN 'Sales'
			ELSE 'Unknown'
		END
FROM Employees

----------------------------------------------------------------
--- Example 3
SELECT Name, 
	   CASE DepartmentID 
			WHEN 1 THEN 'Human Recources'
			WHEN 2 THEN 'Marketing'
			WHEN 3 THEN 'IT'
			WHEN 4 THEN 'Sales'
			ELSE 'Unknown'
		END AS DepartmentName
FROM Employees

----------------------------------------------------------------
--- Example 4
USE C21_DB1

SELECT Sales.SaleID, Sales.SaleAmount,
CASE 
	WHEN Sales.SaleAmount <= 100 THEN 'Weak'
	WHEN Sales.SaleAmount BETWEEN 101 AND 200 THEN 'Good'
	WHEN Sales.SaleAmount BETWEEN 201 AND 300 THEN 'Very Good'
	WHEN Sales.SaleAmount > 300 THEN 'Excellent'
	ELSE 'Not Sepcified'
END AS SaleLevel
FROM Sales

----------------------------------------------------------------
--- Example 5
USE C21_DB1

SELECT Sales.SaleID, Sales.SaleAmount,
CASE 
	WHEN Sales.SaleAmount <= 100 THEN 'Weak'
	WHEN Sales.SaleAmount BETWEEN 101 AND 200 THEN 'Good'
	WHEN Sales.SaleAmount BETWEEN 201 AND 300 THEN 'Very Good'
	WHEN Sales.SaleAmount > 300 THEN 'Excellent'
	ELSE 'Not Sepcified'
END AS SaleLevel
FROM Sales
ORDER BY SaleLevel DESC

----------------------------------------------------------------
--- Example 6
SELECT Sales.SaleID, Sales.SaleAmount,
CASE 
	WHEN Sales.SaleAmount <= 100 THEN 'Weak'
	WHEN Sales.SaleAmount BETWEEN 101 AND 200 THEN 'Good'
	WHEN Sales.SaleAmount BETWEEN 201 AND 300 THEN 'Very Good'
	WHEN Sales.SaleAmount > 300 THEN 'Excellent'
	ELSE 'Not Sepcified'
END AS SaleLevel
FROM Sales
ORDER BY 
		CASE 
			WHEN Sales.SaleAmount > 150 THEN 1
			ElSE 2
		END, SaleAmount DESC

----------------------------------------------------------------
--- Example 7
SELECT 
    e.EmployeeID,
    COUNT(CASE WHEN ea.Status = 'Present' THEN 1 END) AS AttendanceDays
FROM 
    EmployeeAttendance e
INNER JOIN 
    EmployeeAttendance ea ON e.EmployeeID = ea.EmployeeID
GROUP BY 
    e.EmployeeID;


----------------------------------------------------------------
--- Example 8
SELECT 
    e.EmployeeID,
    COUNT(CASE WHEN e.Status = 'Present' THEN 1 END) AS AttendanceDays
FROM 
    EmployeeAttendance e
GROUP BY 
    e.EmployeeID;


----------------------------------------------------------------
--- Example 9
SELECT 
    e.EmployeeID,
    COUNT(CASE WHEN e.Status = 'Present' THEN 1 END) AS AttendanceDays,
	COUNT(CASE WHEN e.Status = 'Absent' THEN 1 END) AS AbsentDays,
	COUNT(CASE WHEN e.Status = 'Leave' THEN 1 END) AS LeaveDays
FROM 
    EmployeeAttendance e
GROUP BY 
    e.EmployeeID
ORDER BY AttendanceDays DESC


----------------------------------------------------------------
--- Example 9
Select Name, Department, PerformanceRating,
Salary = 
CASE 
	WHEN Department = 'IT' THEN
		CASE 
			WHEN PerformanceRating >= 90 THEN Salary*1.25
			WHEN PerformanceRating BETWEEN 89 AND 70 THEN Salary*1.20
			ELSE Salary
		END
	WHEN Department = 'Marketing' THEN
		CASE 
			WHEN PerformanceRating >= 90 THEN Salary*1.20
			WHEN PerformanceRating BETWEEN 89 AND 70 THEN Salary*1.15
			ELSE Salary
		END
	ELSE
		CASE 
			WHEN PerformanceRating >= 90 THEN Salary*1.15
			WHEN PerformanceRating BETWEEN 89 AND 70 THEN Salary*1.10
			ELSE Salary
		END
END
FROM Employees2


