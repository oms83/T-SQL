SELECT LEN(Name) FROM Employees2;

SELECT UPPER(Name) FROM Employees2;

SELECT LOWER(Name) FROM Employees2;

SELECT REVERSE(Name) FROM Employees2;

SELECT TRIM(Name) FROM Employees2;

SELECT LTRIM(Name) FROM Employees2;

SELECT RTRIM(Name) FROM Employees2;

SELECT CONCAT(Name, ' - ', Department) FROM Employees2;

SELECT CONCAT_WS(' : ', UPPER(Name), LOWER(Department)) FROM Employees2;

SELECT SUBSTRING(Name, 1, 8) AS SubStrings FROM Employees2;

SELECT REPLACE(Department, 'Marketing', 'Sales') AS NewDepartment FROM Employees2;

SELECT LEFT(Name, 8) FROM Employees2;

SELECT RIGHT(Name, 1) FROM Employees2;
