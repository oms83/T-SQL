select * from Students

-- Row_Number
select *, ROW_NUMBER() over (order by grade desc) from Students
/*
11	Omer---	Turkish	100	1	1
10	Ali	Turkish	98	1	2
5	Emma	Science	92	1	3
1	Alice	Math	90	1	4
3	Charlie	Math	88	1	5
4	Dave	Science	88	1	5
2	Bob	Math	85	1	7
6	Fiona	Science	84	1	8
8	Henry	English	80	1	9
7	Grace	English	75	1	10
*/
-------------------------------------------

-- Rank
select *, Rank() over (order by grade desc) from Students 
/*
11	Omer---	Turkish	100	1	1
10	Ali	Turkish	98	1	2
5	Emma	Science	92	1	3
1	Alice	Math	90	1	4
3	Charlie	Math	88	1	5
4	Dave	Science	88	1	5
2	Bob	Math	85	1	7
6	Fiona	Science	84	1	8
8	Henry	English	80	1	9
7	Grace	English	75	1	10
*/
-------------------------------------------


-- Dense_Rank()
select *, Dense_Rank() over (order by grade desc) from Students 
/*
11	Omer---	Turkish	100	1	1
10	Ali	Turkish	98	1	2
5	Emma	Science	92	1	3
1	Alice	Math	90	1	4
3	Charlie	Math	88	1	5
4	Dave	Science	88	1	5
2	Bob	Math	85	1	6
6	Fiona	Science	84	1	7
8	Henry	English	80	1	8
7	Grace	English	75	1	9
*/
-------------------------------------------


-- Pagging()

declare @RowPerPage int = 5;
declare @PageNumber int = 1;

select * from Students
order by Grade
offset (@PageNumber - 1)*@RowPerPage  Rows
fetch next @RowPerPage Rows Only
/*
7	Grace	English	75	1
8	Henry	English	80	1
6	Fiona	Science	84	1
2	Bob	Math	85	1
3	Charlie	Math	88	1
*/
-------------------------------------------


-- Partition
select *, Rank() over (partition by Subject order by Grade desc) from Students
/*
8	Henry	English	80	1	1
7	Grace	English	75	1	2
1	Alice	Math	90	1	1
3	Charlie	Math	88	1	2
2	Bob	Math	85	1	3
5	Emma	Science	92	1	1
4	Dave	Science	88	1	2
6	Fiona	Science	84	1	3
11	Omer---	Turkish	100	1	1
10	Ali	Turkish	98	1	2
*/
-------------------------------------------


-- Partition With Group BY
SELECT S.StudentID, S.Name, SubjectsGroup.Subject, S.Grade, S.IsActive
FROM
(
	select Subject from Students Group By Subject
) SubjectsGroup
INNER JOIN  Students S ON SubjectsGroup.Subject =  S.Subject
/*
7	Grace	English	75	1
8	Henry	English	80	1
1	Alice	Math	90	1
2	Bob	Math	85	1
3	Charlie	Math	88	1
4	Dave	Science	88	1
5	Emma	Science	92	1
6	Fiona	Science	84	1
10	Ali	Turkish	98	1
11	Omer---	Turkish	100	1
*/
-------------------------------------------


-- Ex3
Select *
,Sum(Grade) over (partition by Subject) as SumOfGrade
,Avg(Grade) over (partition by Subject) as AvgOfGrade
from Students
/*
7	Grace	English	75	1	155	77
8	Henry	English	80	1	155	77
1	Alice	Math	90	1	263	87
2	Bob	Math	85	1	263	87
3	Charlie	Math	88	1	263	87
4	Dave	Science	88	1	264	88
5	Emma	Science	92	1	264	88
6	Fiona	Science	84	1	264	88
10	Ali	Turkish	98	1	198	99
11	Omer---	Turkish	100	1	198	99
*/
-------------------------------------------


-- Ex4
select Subject
	,Sum(Grade) AS SumOfGrade 
	,Avg(Grade) AS AvgOfGrade 
	,Count(*) AS CountOfStudents
from Students Group By Subject
/*
English	155	77	2
Math	263	87	3
Science	264	88	3
Turkish	198	99	2
*/
