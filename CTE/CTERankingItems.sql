CREATE TABLE SalesRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO SalesRecords (EmployeeID, SaleAmount, SaleDate) VALUES
(1, 1200.50, '2023-01-10'),
(2, 800.00, '2023-01-11'),
(1, 600.25, '2023-01-15'),
(3, 950.75, '2023-01-20'),
(2, 400.00, '2023-01-21'),
(1, 300.00, '2023-01-25'),
(3, 1200.00, '2023-01-30'),
(2, 750.00, '2023-02-05'),
(1, 500.00, '2023-02-10'),
(3, 850.00, '2023-02-15'),
(4, 3000.75, '2023-02-15');
-----------------------------------


WITH SalesTotals AS
(
	SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
	FROM SalesRecords
	GROUP BY EmployeeID
), RankedSales AS
(
	SELECT EmployeeID, TotalSales, RANK() OVER (ORDER BY TotalSales DESC)  AS SalesRank
	FROM SalesTotals
)
SELECT EmployeeID, TotalSales, SalesRank
FROM RankedSales

/*
3	3000.75	1
4	3000.75	1
1	2600.75	3
2	1950.00	4
*/

