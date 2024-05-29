-- INLINE TABLE VALUED FUNCTION
-- USES ONLY ONE SELECT STATEMENT

-- You cannot use UPDATE or INSERT statements in Inline Table-Valued Functions (ITVFs) in T-SQL. Inline Table-Valued Functions are designed to be 
-- read-only, and they return a table variable that is essentially a result of a single SELECT statement. Since these functions are read-only, 
-- they cannot modify the data in the database, which means you cannot perform data manipulation operations like INSERT, UPDATE, DELETE, or MERGE within them.


CREATE FUNCTION GetStudentsBySubject(@subjects VARCHAR(50))
RETURNS TABLE
AS
RETURN 
(
	SELECT * FROM Students WHERE Subject = @subjects
)

--
SELECT * FROM dbo.GetStudentsBySubject('Math')

--
/*
1	Alice	Math	90
2	Bob	Math	85
3	Charlie	Math	78
*/
