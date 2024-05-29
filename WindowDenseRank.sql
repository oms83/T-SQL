Use C21_DB1
--
SELECT * FROM Students ORDER BY Grade DESC;

-- ROW_NUMBER()
SELECT *, ROW_NUMBER() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC
  
/*
    ROW_NUMBER
Science	92	1
Math	90	2
Science	88	3
English	88	4
Math	85	5
Science	84	6
English	80	7
Math	78	8
English	75	9
*/
  
  
-- RANK() 
SELECT *, RANK() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC

/*
        RANK
Science	92	1
Math	90	2
Science	88	3
English	88	3
Math	85	5
Science	84	6
English	80	7
Math	78	8
English	75	9

Here, 4 has been eliminated.
*/

  

-- DENSE_RANK()
SELECT *, DENSE_RANK() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC

/*
Science	92	1
Math	90	2
Science	88	3
English	88	3
Math	85	4
Science	84	5
English	80	6
Math	78	7
English	75	8
*/
