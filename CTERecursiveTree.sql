WITH EmployeeTreeHierarchy AS 
(
	SELECT  EmployeeID, ManagerID, Name,  
	CAST(Name AS VARCHAR(MAX)) AS 'Hierarchy', 0 AS Level
	FROM Employees7
	WHERE ManagerID IS NULL

	UNION ALL 

	SELECT  e.EmployeeID, e.ManagerID, e.Name,  
	CAST(ETH.Hierarchy + ' -> ' + e.Name AS VARCHAR(MAX)),
	ETH.Level + 1 AS Level
	FROM Employees7 e
	INNER JOIN EmployeeTreeHierarchy ETH ON ETH.EmployeeID = e.ManagerID
)
SELECT * FROM EmployeeTreeHierarchy
select * from Employees7

