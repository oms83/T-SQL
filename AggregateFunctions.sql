SELECT SUM(Salary) AS Summation FROM Employees2 GROUP BY Department;

SELECT AVG(Salary) AS Average FROM Employees2 GROUP BY Department;

SELECT COUNT(1) AS Employees FROM Employees2 GROUP BY Department;

SELECT MAX(Salary) FROM Employees2 GROUP BY Department;

SELECT MIN(Salary) FROM Employees2 GROUP BY Department;
