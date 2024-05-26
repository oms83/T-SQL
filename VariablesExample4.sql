USE C21_DB1

CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY,
	Name VARCHAR(50),
	LoyaltyPoint INT,
);

INSERT INTO Customers (CustomerID, Name, LoyaltyPoint) VALUES (1, 'Omer MEMES', 0);
INSERT INTO Customers (CustomerID, Name, LoyaltyPoint) VALUES (2, 'Ali MEMES', 0);
INSERT INTO Customers (CustomerID, Name, LoyaltyPoint) VALUES (3, 'Abd-Alrahman MEMES', 0);

CREATE TABLE Purchases
(
	PurchaseID INT PRIMARY KEY,
	CustomerID INT, 
	PurchaseDate DATE,
	Amount DECIMAL(10 , 2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (1, 1, '2024-07-01', 435.6);
INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (2, 1, '2024-07-01', 12.00);
INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (3, 3, '2024-07-01', 65.23);
INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (4, 2, '2024-07-01', 36.6);
INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (5, 1, '2024-07-02', 65.43);
INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Amount) VALUES (6, 1, '2024-07-03', 45.67);

------------> T-SQL
Use C21_DB1


DECLARE @CustomerID INT;
DECLARE @TotalSpent DECIMAL(10, 2);
DECLARE @PointEarned INT;
DECLARE @CurrentYear INT = YEAR(GETDATE());

SET @CustomerID = 1;

SELECT @TotalSpent = SUM(Amount) 
FROM Purchases 
WHERE CustomerID = @CustomerID 
AND   YEAR(PurchaseDate) = @CurrentYear;

SET @PointEarned = CAST((@TotalSpent / 10) AS INT);

UPDATE Customers 
SET LoyaltyPoint = LoyaltyPoint + @PointEarned
WHERE CustomerID = @CustomerID;

PRINT 'Total Amount Spent in: ' + CAST(@CurrentYear AS NVARCHAR) + ': $' + CAST(@TotalSpent AS VARCHAR);
PRINT 'Loyalty Point Update For Cutomer ID: ' + CAST(@CustomerID AS VARCHAR);
PRINT 'Loyalty Point Earned: ' + CAST(@PointEarned AS VARCHAR);

----------> Output
Total Amount Spent in: 2024: $558.70
Loyalty Point Update For Cutomer ID: 1
Loyalty Point Earned: 55
