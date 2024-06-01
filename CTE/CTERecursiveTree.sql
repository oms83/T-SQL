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


/*
1	NULL	CEO	CEO	0
2	1	VP of Sales	CEO -> VP of Sales	1
3	1	VP of Marketing	CEO -> VP of Marketing	1
9	1	VP IT	CEO -> VP IT	1
6	3	Marketing Manager	CEO -> VP of Marketing -> Marketing Manager	2
8	6	Marketing Specialist	CEO -> VP of Marketing -> Marketing Manager -> Marketing Specialist	3
4	2	Sales Manager	CEO -> VP of Sales -> Sales Manager	2
5	2	Sales Representative	CEO -> VP of Sales -> Sales Representative	2
7	4	Sales Associate	CEO -> VP of Sales -> Sales Manager -> Sales Associate	3
*/
