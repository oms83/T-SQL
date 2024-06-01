Use C21_DB1

SELECT *
	   ,LAG(Grade, 1) OVER (ORDER BY Grade DESC) AS PreviousGrade
	   , Grade
	   ,LEAD(Grade, 1) OVER (ORDER BY Grade DESC) AS PreviousGrade
FROM Students

SELECT * FROM Students


/*
5	Emma	Science	92	NULL	92	90
1	Alice	Math	90	92	90	88
4	Dave	Science	88	90	88	88
9	Isabella	English	88	88	88	85
2	Bob	Math	85	88	85	84
6	Fiona	Science	84	85	84	80
8	Henry	English	80	84	80	78
3	Charlie	Math	78	80	78	75
7	Grace	English	75	78	75	NULL
*/
