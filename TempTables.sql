Create Table #EmployeesTemp
(
	EmployeeID Int Primary Key,
	Name Varchar(100),
	Department Varchar(50)
);

Insert Into #EmployeesTemp (EmployeeID, Name, Department) Values (1, 'Omer MEMES', 'IT');
Insert Into #EmployeesTemp (EmployeeID, Name, Department) Values (2, 'Ali MEMES', 'IT');

Select * From #EmployeesTemp
