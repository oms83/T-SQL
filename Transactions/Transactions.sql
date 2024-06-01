Use C21_DB1 

Create Table Accounts
(
	AccountID INT Primary Key,
	Balance Decimal(10, 2)
);

Create Table Transactions
(
	TransactionID Int Primary Key,
	FromAccount Int, 
	ToAccount Int,
	Amount Decimal(10, 2),
	TransactionDate Date
);

Insert Into Accounts (AccountID, Balance) Values (1, 500.00);
Insert Into Accounts (AccountID, Balance) Values (2, 300.00);

Begin Transaction
	Begin Try 
	
		-- Subtract $100 from Account 2
		Update Accounts SET Balance = Balance - 100 Where AccountID = 2;

		-- Add $100 to Account 1
		Update Accounts SET Balance = Balance + 100 Where AccountID = 1;

		-- Log the transaction
		Insert Into Transactions (TransactionID, FromAccount, ToAccount, Amount, TransactionDate) Values (1, 2, 1, 100.00, GETDATE());

		-- Commit the transaction
		Commit;
	End Try

	Begin Catch
		-- Rollback in case of error
		RollBack;
		-- Error handling code here
	End Catch


-- The BEGIN TRANSACTION starts the transaction.
-- BEGIN TRY...END TRY handles successful execution.
-- BEGIN CATCH...END CATCH handles any errors, rolling back the transaction if necessary.
-- COMMIT confirms the transaction; ROLLBACK undoes it in case of errors.
