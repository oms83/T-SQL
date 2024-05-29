Use C21_DB1

DECLARE @RowPerPage INT = 3;
DECLARE @PageNumber INT = 1;

SELECT * FROM Students
ORDER BY Grade
OFFSET (@PageNumber - 1 ) * @RowPerPage ROWS
FETCH NEXT @RowPerPage ROWS ONLY

/*
7	Grace	English	75
3	Charlie	Math	78
8	Henry	English	80
*/

-- OFFSET: Skips a set number of rows in the data.
-- FETCH NEXT: Retrieves a specific number of rows after the offset.
