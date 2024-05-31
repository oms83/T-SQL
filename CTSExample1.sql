USE C21_DB1;

-- Sub Quiry
SELECT * FROM 
(
	SELECT Name, Subject, Grade 
	FROM Students 

) AS StudentInfo;
-- Common Table Expression (CTE)
-- CTE
WITH StudentInfo AS
(
	SELECT Name, Subject, Grade 
	FROM Students 
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
