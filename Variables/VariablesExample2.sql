USE C21_DB1;

GO

CREATE TABLE Sales
(
	SaleID INT PRIMARY KEY,
	SaleDate DATE,
	SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, SaleAmount) VALUES (1, '2023-06-01', 160.00);
INSERT INTO Sales (SaleID, SaleDate, SaleAmount) VALUES (2, '2023-06-03', 150.00);
INSERT INTO Sales (SaleID, SaleDate, SaleAmount) VALUES (3, '2023-06-04', 100.00);
INSERT INTO Sales (SaleID, SaleDate, SaleAmount) VALUES (4, '2023-07-10', 50.00);
INSERT INTO Sales (SaleID, SaleDate, SaleAmount) VALUES (5, '2023-07-11', 250.00);


---------------> T-SQL

DECLARE @Year INT;
DECLARE @Month INT;
DECLARE @TotalTransaction INT;
DECLARE @TotalSales DECIMAL(10, 2);
DECLARE @AverageSales DECIMAL(10, 2);

SET @Year = 2023;
SET @Month = 6;

SELECT @TotalSales = SUM(SaleAmount)
FROM Sales 
WHERE MONTH(SaleDate) = @Month AND YEAR(SaleDate) = @Year;

SELECT @TotalTransaction = COUNT(*)
FROM Sales
WHERE MONTH(SaleDate) = @Month AND YEAR(SaleDate) = @Year;

SELECT @AverageSales = @TotalSales / @TotalTransaction;

PRINT 'Monthly Sales Summary Report:'
PRINT 'Year: ' + CAST(@Year AS VARCHAR) + ', Month: ' + CAST(@Month AS VARCHAR);
PRINT 'Total Sales: ' + CAST(@TotalSales AS VARCHAR);
PRINT 'Total Transaction: ' + CAST(@TotalTransaction AS VARCHAR);
PRINT 'Average Sales: ' + CAST(@AverageSales AS VARCHAR);

---------------> OUTPUT
Monthly Sales Summary Report:
Year: 2023, Month: 6
Total Sales: 410.00
Total Transaction: 3
Average Sales: 136.67

