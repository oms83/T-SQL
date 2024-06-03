SELECT GETDATE() AS CurrentDate; -- 2024-05-28 19:57:47.587

SELECT SysDateTime() AS CurrentDateTime; -- 2024-05-28 19:57:56.1377148

SELECT DATEADD(DAY, 10, GETDATE()) AS DatePlus10Day -- 2024-06-07 19:58:02.907

SELECT DATEDIFF(DAY, '01-01-2024', GETDATE()); -- 148

SELECT EOMONTH(GETDATE()) -- 2024-05-31 --> Last Date/Day Of Current Month

SELECT DATENAME(MONTH, GETDATE()) -- May

SELECT DATENAME(YEAR, GETDATE()) -- 2024

SELECT DATEPART(YEAR, GETDATE()); -- 2024

SELECT DATEPART(MONTH, GETDATE()); -- 5

SELECT DAY(GETDATE()); -- 28

SELECT MONTH(GETDATE()); -- 5

SELECT YEAR(GETDATE()); -- 2024

SELECT CONVERT(VARCHAR, GETDATE(), 103); -- DD/MM/YYYY 28/05/2024

SELECT CAST(GETDATE() AS DATE) -- 2024-05-28