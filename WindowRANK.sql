Use C21_DB1
--
SELECT * FROM Students ORDER BY Grade DESC;

--
SELECT *, ROW_NUMBER() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC
  
/*
    ROW_NUMBER
Science	      92	1
Math        	90	2
Science	      88	3
English	      88	4
Math	        85	5
Science	      84	6
English	      80	7
Math	        78	8
*/
  
--
SELECT *, RANK() OVER (ORDER BY Grade DESC) AS RowNumber 
FROM Students 
ORDER BY Grade DESC

/*
        RANK
Science	      92	1
Math        	90	2
Science	      88	3
English	      88	3
Math	        85	5
Science	      84	6
English	      80	7
Math	        78	8
*/
Alice	Math	90	2
Dave	Science	88	3
Isabella	English	88	4
Bob	Math	85	5
Fiona	Science	84	6
Henry	English	80	7
Charlie	Math	78	8
Grace	English	75	9
