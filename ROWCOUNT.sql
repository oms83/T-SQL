
-- @@ROWCOUNT is a system function in T-SQL (Transact-SQL used in Microsoft SQL Server) that returns the number of rows affected --by the last 
--  statement executed. This function is commonly used to determine how many rows were impacted by the previous operation, such as 
--  an INSERT, UPDATE, DELETE, or SELECT statement.


-- It must be checked immediately after the statement whose impact you want to measure, because any subsequent statement, including something 
--  as simple as a PRINT statement, will reset @@ROWCOUNT to the number of rows affected by that subsequent statement.

-- @@ROWCOUNT is often used to verify the success of a statement or to take conditional action depending on the number of rows affected.


-- Practical Considerations --
-- Immediate Check: Always check @@ROWCOUNT immediately after the relevant SQL statement, as its value is reset after each statement.

-- Use in Conditional Logic: It's often used in conditional logic, such as in IF statements, to take different actions depending on the 
--  number of rows affected by a previous operation.

-- Zero Rows Affected: If no rows are affected by the previous operation, @@ROWCOUNT returns 0. This can be useful to check whether 
--  a conditional update or delete actually changed any data.

-- Compatibility: @@ROWCOUNT is widely supported and is a standard part of T-SQL, making it compatible with various versions of SQL Server.


Update Employees Set DepartmentID = 3 Where DepartmentID = 4;

Select @@ROWCOUNT As RowsAffected
