declare @amount int = 100 
begin transaction

begin try
	update Accounts set Balance = Balance - @amount where AccountID = 1
	update Accounts set Balance = Balance + @amount where AccountID = 2

	insert into Transactions (FromAccount, ToAccount, Amount, Date) values (1, 2, 100, GETDATE());
	
	commit
end try

begin catch
	rollback
end catch

select * from Accounts
