USE C21_DB1;

-- Sub Quiry
SELECT * FROM 
(
	SELECT Name, Subject, Grade  FROM Students 
) AS StudentInfo;

-- CTE
WITH StudentInfo AS
(
	SELECT Name, Subject, Grade FROM Students 
)
SELECT * FROM StudentInfo



-- Sub Quiry
SELECT * FROM 
(
	SELECT Department, SUM(Salary) AS Sum, AVG(Salary) AS Average
	FROM Employees2 
	GROUP BY Department

) AS EmployeesInfo;


-- CTE
WITH EmployeesInfo AS
(
	SELECT Department, SUM(Salary) AS Sum, AVG(Salary) AS Average
	FROM Employees2 
	GROUP BY Department
)
SELECT * FROM EmployeesInfo


-- CTE
WITH CTE AS
(
	SELECT Department, MAX(Salary) AS MaxSalary
	FROM Employees2 
	GROUP BY Department
)
SELECT Name, CTE.Department, CTE.MaxSalary FROM CTE
INNER JOIN Employees2 ON CTE.MaxSalary = Employees2.Salary AND CTE.Department = Employees2.Department
