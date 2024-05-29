
CREATE FUNCTION MaxSalaryPerDepartment()
RETURNS @Result Table
(
	Name VARCHAR(100),
	Department VARCHAR(100),
	MaxSalary INT
)
AS
BEGIN
	INSERT INTO @Result (Name, Department, MaxSalary)
	SELECT E.Name, T.Department, T.MaxSalary FROM 
	(SELECT Department, MAX(Salary) AS MaxSalary FROM Employees2 GROUP BY Department) T
	INNER JOIN Employees2 E ON E.Department = T.Department AND T.MaxSalary = E.Salary

	RETURN;
END


SELECT * FROM MaxSalaryPerDepartment();


---
SELECT E.Name, T.Department, T.MaxSalary FROM 
(SELECT Department, MAX(Salary) AS MaxSalary FROM Employees2 GROUP BY Department) T
INNER JOIN Employees2 E ON E.Department = T.Department AND T.MaxSalary = E.Salary
