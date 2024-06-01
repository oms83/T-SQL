Declare @Employees Table
(
	EmployeeID Int Primary Key,
	Name Varchar(100),
	Department Varchar(50)
);

Insert Into @Employees (EmployeeID, Name, Department) Values (1, 'Omer MEMES', 'IT');
Insert Into @Employees (EmployeeID, Name, Department) Values (2, 'Ali MEMES', 'IT');

Select * From @Employees

-- What are table variables used for in T-SQL?
-- Storing a set of records temporarily

-- What is the correct syntax to declare a table variable in T-SQL?
-- DECLARE @MyTable TABLE (...)

-- Table variables are stored in which database?
-- They are stored in memory and not in a specific database

-- What is the scope of a table variable?
-- Limited to the batch, stored procedure, or function in which it is defined.

-- Can you use a table variable in a JOIN clause?
-- Yes, table variables can be used in JOINs like regular tables.

-- What is a limitation of table variables in T-SQL?
-- Limited indexing options

-- How are changes to table variables handled in transactions?
-- Changes are not logged, and cannot be rolled back.

-- What is an advantage of using table variables in terms of performance?
-- Minimal logging for modifications

-- Can table variables be indexed in T-SQL?
-- Yes, but only at the time of declaration as a primary key.

-- They are cleaned up automatically at the end of the batch, procedure, or function.
-- Which of the following statements is true about table variables?
