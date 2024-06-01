
-- Case Simple Examples
SELECT Name
	  ,CASE DepartmentID
			WHEN 1 THEN 'Human Resources'
			WHEN 2 THEN 'Marketing'
			WHEN 3 THEN 'IT'
			WHEN 4 THEN 'Sales'
			ELSE 'Unknown'
	   END 
	   AS Department

	  ,Gender = CASE
			WHEN Gender = 0 THEN 'Male'
			WHEN Gender = 1 THEN 'Female'
			ELSE 'Unknown'
		END -- AS GENDER => Error

	  ,CASE
			WHEN  IsActive = 0 THEN 'Inactive'
			WHEN  IsActive = 1 THEN 'Active'
			ELSE 'Unknown'
		END AS Active

FROM Employees
------------------------------------------------------

-- Case With Searching
SELECT  SaleID, SaleAmount,
		CASE 
			WHEN SaleAmount < 100 THEN 'Weak'
			WHEN SaleAmount Between 100 And 200 THEN 'Good'
			WHEN SaleAmount Between 201 And 250 Then 'Ver Good'
			WHEN SaleAmount > 250 Then 'Excellent'
			ELSE 'Not Specified'
		END					
FROM Sales
------------------------------------------------------

-- Case With Order By
Select * From Sales 
Order By 
		Case
			When SaleAmount > 150 Then 1
			Else 2
		End 
-- It will give all the fields that fulfilled the first condition 1 otherwise 2 and then the 
-- records will be arranged according to 1 and 2
------------------------------------------------------

-- Case With Update Statement
UPDATE Employees2 
SET Salary = 
CASE 
	WHEN PerformanceRating > 90 THEN Salary * 1.5
	WHEN PerformanceRating > 80 THEN Salary * 1.25
	WHEN PerformanceRating > 70 THEN Salary * 1.15
	WHEN PerformanceRating > 60 THEN Salary * 1.10
	ELSE Salary
END
------------------------------------------------------

--  Nested Case Statements
SELECT 
		 Name
		,Department
		,PerformanceRating
		,Bouns = 
			CASE
				WHEN Department LIKE 'Marketing' THEN
					CASE 
						WHEN PerformanceRating > 90 THEN Salary * 1.20
						WHEN PerformanceRating > 80 THEN Salary * 1.15
						WHEN PerformanceRating > 70 THEN Salary * 1.10
						ELSE Salary
					END
				WHEN Department LIKE 'HR' THEN
					CASE 
						WHEN PerformanceRating > 90 THEN Salary * 1.15
						WHEN PerformanceRating > 80 THEN Salary * 1.10
						WHEN PerformanceRating > 70 THEN Salary * 1.05
						ELSE Salary
					END
				WHEN Department LIKE 'IT' THEN
					CASE 
						WHEN PerformanceRating > 90 THEN Salary * 1.5
						WHEN PerformanceRating > 80 THEN Salary * 1.25
						WHEN PerformanceRating > 70 THEN Salary * 1.15
						ELSE Salary
					END
				END
FROM Employees2
------------------------------------------------------

--  Case With Group BY
-- Ex1
SELECT PerformanceCategory, AVG(Salary) AS AverageSalary, COUNT(*) AS NumberOfEmployee FROM 
(
	SELECT	Name, Salary,
			CASE 
				WHEN PerformanceRating > 90 THEN 'High'
				WHEN PerformanceRating > 80 THEN 'Medium'
				ELSE 'Low'
			END AS PerformanceCategory 
	FROM Employees2
) AS PerformanceTable
GROUP BY PerformanceCategory

--Ex2
SELECT IsActiveCategory, COUNT(*) AS NumberOfEmployee FROM 
(
	SELECT Name, CASE Gender
					WHEN 0 THEN 'Male'
					WHEN 1 THEN 'Female'
					ELSE 'Unknown'
				 END AS 'Gender'
				 , CASE IsActive
					WHEN 1 THEN 'Active'
					WHEN 0 THEN 'Inactive'
					ELSE 'Unknown'
				   END IsActiveCategory
	FROM Employees
) AS IsActiveTable
GROUP BY IsActiveCategory
------------------------------------------------------
