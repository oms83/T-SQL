USE C21_DB1

DECLARE @Balance DECIMAL(10, 2) = 950.00;
DECLARE @Withdrawal DECIMAL(10, 2) = 100.00;

WHILE @Balance > 0
BEGIN
	SET @Balance = @Balance - @Withdrawal
	
	IF (@Balance < 0)
	BEGIN
		PRINT 'Infsufficient funds for withdrawal'
		BREAK
	END 
	
	PRINT 'New Balance: ' + CAST(@Balance AS VARCHAR)
END

--New Balance: 850.00
--New Balance: 750.00
--New Balance: 650.00
--New Balance: 550.00
--New Balance: 450.00
--New Balance: 350.00
--New Balance: 250.00
--New Balance: 150.00
--New Balance: 50.00
--Infsufficient funds for withdrawal
