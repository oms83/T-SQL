WITH SalesTatols AS 
(
	SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
	FROM SalesRecords
	GROUP BY EmployeeID
),
TopSalesEmployees AS (
		SELECT TOP 3 EmployeeID, TotalSales
		FROM SalesTatols
		ORDER BY TotalSales DESC
)
SELECT AVG(TotalSales) FROM TopSalesEmployees
