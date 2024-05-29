-- INLINE TABLE VALUED FUNCTION
-- USES ONLY ONE SELECT STATEMENT
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
