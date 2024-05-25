-- IF Statement 
DECLARE @a INT, @b INT;
SET @a = 10
SET @b = 9;

IF @a > @b
	BEGIN
		PRINT 'A greater than B';
	END



-- IF-ELSE
IF @a > @b
	BEGIN
		PRINT 'A greater than B';
	END
ELSE
	BEGIN
		PRINT 'B greater than A';
	END



-- Nested If Statement
DECLARE @Grade INT;
SET @Grade = 92;
IF @Grade >= 90
	BEGIN 
		PRINT 'AA';
	END
ELSE
	BEGIN
		IF @Grade >= 80
			BEGIN
				PRINT 'BA';
			END
		IF @Grade >= 70
			BEGIN 
				PRINT 'BB';
			END
		IF @Grade >= 60
			BEGIN 
				PRINT 'BC';
			END
		IF @Grade >= 50
			BEGIN 
				PRINT 'CC';
			END
		ELSE
			BEGIN
				PRINT 'FF';
			END
	END
------------------------------------------------------
-- IF Statement Example 1
DECLARE @max INT, @n1 INT, @n2 INT;
SET @n1 = 10;
SET @n2 = 21;

IF @n1 > @n2
	SET @max = @n1;
ELSE
	SET @max = @n2;

PRINT @max;


------------------------------------------------------
-- IF Statement Example 2 (AND Logical Operation)
DECLARE @Age INT;
DECLARE @Salary DECIMAL(10, 2);
SET @Age = 25;
SET @Salary = 50000;

IF @Age > 18 AND @Salary >= 50000
	PRINT 'Eligable for the loan';
ELSE
	PRINT 'Not eligable for the loan';


------------------------------------------------------
-- IF Statement Example 3 (OR Logical Operation)
DECLARE @Grade CHAR(1) = 'B';
DECLARE @AttendacePrecentage INT = 75;

IF @Grade = 'A' OR  @AttendacePrecentage > 70
	PRINT 'Qualified for extra-curricular activities';
ELSE
	PRINT 'Not qualified for extra-curricular activities';


------------------------------------------------------
-- IF Statement Example 4 (NOT Logical Operation)
DECLARE @CutomerStatus VARCHAR(10) = 'Active';

IF NOT (@CutomerStatus = 'Active')
	PRINT 'Send re-engengment email';
ELSE
	PRINT 'Cusotmer is Active';


------------------------------------------------------
-- IF Statement Example 5 (Error Handling)
USE C21_DB1

DECLARE @ErrorValue INT;

INSERT INTO Employees (Name) Values ('Omer MEMES');

SET @ErrorValue = @@ERROR;

IF @ErrorValue <> 0
	BEGIN 
		PRINT 'An Error Occurred With Error Value: ' + CAST(@ErrorValue AS VARCHAR);
	END


------------------------------------------------------
-- IF Statement Example 5 (Exist Statement)

IF EXISTS(SELECT * FROM Employees WHERE NAME LIKE 'Omer MEMES')
	BEGIN
		PRINT 'Yes, Omer MEMES is exist';
	END
ELSE	
	BEGIN 
		PRINT 'No, Omer MEMES is not exist';
	END

------------------------------------------------------------------
Best Practices
Keep the logic within IF statements simple for better readability.
Avoid deeply nested IF statements when possible. Consider alternative structures like CASE statements or stored procedures.
Ensure conditions are clear and cover all expected cases.

Summary
The IF statement in T-SQL is a fundamental tool for controlling the flow of execution based on conditions. 
It's versatile and can be used in a variety of scenarios, from simple checks to complex decision-making processes. 
Understanding and utilizing IF statements effectively can greatly enhance the functionality and efficiency of your SQL scripts.
------------------------------------------------------------------
------------------------------QUIZ--------------------------------
------------------------------------------------------------------
What is the purpose of the IF statement in T-SQL?
To execute or skip a statement block based on a specified condition

What is the syntax of an IF statement in T-SQL?
IF condition BEGIN, END

What happens if an IF statement does not have an ELSE part?
The IF statement will execute if the condition is true

Can IF statements be nested in T-SQL?
Yes, IF statements can be nested

What can variables be used for within an IF statement?
To execute dynamic conditions
To assign a value based on a condition

What is the purpose of @@ERROR in T-SQL?
To handle errors or unexpected conditions in T-SQL

How can you create an alternate action for when an IF statement's condition is false in T-SQL?
Use ELSE

What does a nested IF statement allow you to do?
Check for multiple conditions in a sequence.

What does the IF EXISTS clause check in T-SQL?
The existence of rows in a table that meet a certain condition.

In error handling, what does IF @@ERROR <> 0 signify in T-SQL?
There were no errors in the previous SQL statement.




