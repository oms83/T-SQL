Use C21_DB1

-- RANK() PARTITION
SELECT *, RANK() OVER (PARTITION BY Subject ORDER BY Grade DESC) AS GradeRank
FROM Students 

SELECT *, RANK() OVER (PARTITION BY Subject ORDER BY Name) 
FROM Students 

SELECT * FROM Students 
ORDER BY Subject, Grade DESC

/*
7	Grace	English	75	1
8	Henry	English	80	2
9	Isabella	English	88	3
1	Alice	Math	90	1
2	Bob	Math	85	2
3	Charlie	Math	78	3
4	Dave	Science	88	1
5	Emma	Science	92	2
6	Fiona	Science	84	3
*/
