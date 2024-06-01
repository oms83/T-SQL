SELECT SUM(Salary) AS Summation FROM Employees2 GROUP BY Department;

SELECT AVG(Salary) AS Average FROM Employees2 GROUP BY Department;

SELECT COUNT(1) AS Employees FROM Employees2 GROUP BY Department;

SELECT MAX(Salary) FROM Employees2 GROUP BY Department;

SELECT MIN(Salary) FROM Employees2 GROUP BY Department;


SELECT e1.Name, e1.Department, T.MaxSalary
FROM 
(
    SELECT Department, MAX(Salary) AS MaxSalary
    FROM Employees2
    GROUP BY Department
) T
INNER JOIN Employees2 e1 ON e1.Department = T.Department AND e1.Salary = T.MaxSalary
ORDER BY e1.Department;

استعلام بيعطي نتيجة أعلى راتب موظف في كل قسم
