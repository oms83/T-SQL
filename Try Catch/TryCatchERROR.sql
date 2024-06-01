
USE C21_DB1


Insert Into Departments(DepartmentID, Name) Values (1, 'Business');

Declare @ErrorNumber INT = @@Error

If @ErrorNumber <> 0
Begin
	Print 'An error occurred during insertion operation';
	Print 'The error number: ' + CAST(@ErrorNumber AS Varchar);
End
