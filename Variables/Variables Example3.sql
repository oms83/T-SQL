USE C21_DB1

GO 

CREATE TABLE EmployeeAttendance 
(
	RecordID INT PRIMARY KEY,
	EmployeeID INT,
	AttendanceDate DATE,
	Status VARCHAR(10)
);

INSERT INTO EmployeeAttendance (RecordID, EmployeeID, AttendanceDate, Status) VALUES (1, 101, '2023-07-01', 'Present');
INSERT INTO EmployeeAttendance (RecordID, EmployeeID, AttendanceDate, Status) VALUES (2, 102, '2023-07-01', 'Absent');
INSERT INTO EmployeeAttendance (RecordID, EmployeeID, AttendanceDate, Status) VALUES (3, 103, '2023-07-01', 'Leave');
INSERT INTO EmployeeAttendance (RecordID, EmployeeID, AttendanceDate, Status) VALUES (4, 101, '2023-07-02', 'Present');
INSERT INTO EmployeeAttendance (RecordID, EmployeeID, AttendanceDate, Status) VALUES (5, 102, '2023-07-02', 'Present');

SELECT * FROM EmployeeAttendance

--------------> T-SQL

DECLARE @EmployeeID INT;
DECLARE @ReportYear INT;
DECLARE @ReportMonth INT;
DECLARE @TotalDays INT;
DECLARE @PresentDays INT;
DECLARE @AbsentDays INT;
DECLARE @LeaveDays INT;


SET @EmployeeID = 101;
SET @ReportMonth = 7;
SET @ReportYear = 2023;

-- DATEFROMPARTS convert numbers to format of date
-- EOMONTH Gets number days of month in this date
SELECT @TotalDays = DAY(EOMONTH(DATEFROMPARTS(@ReportYear, @ReportMonth, 1)));

SELECT @PresentDays = COUNT(*) 
FROM EmployeeAttendance 
WHERE @ReportMonth = MONTH(AttendanceDate) 
AND   @ReportYear = YEAR(AttendanceDate)
AND   @EmployeeID = EmployeeID
AND   Status LIKE 'Present';

SELECT @LeaveDays = COUNT(*) 
FROM EmployeeAttendance 
WHERE @ReportMonth = MONTH(AttendanceDate) 
AND   @ReportYear = YEAR(AttendanceDate)
AND   @EmployeeID = EmployeeID
AND   Status LIKE 'Leave';

SELECT @AbsentDays = COUNT(*) 
FROM EmployeeAttendance 
WHERE @ReportMonth = MONTH(AttendanceDate) 
AND   @ReportYear = YEAR(AttendanceDate)
AND   @EmployeeID = EmployeeID
AND   Status LIKE 'Absent';

PRINT 'Employees Attendace Report:'
PRINT 'Report Month: ' + CAST(@ReportMonth AS VARCHAR);
PRINT 'Report Year: ' + CAST(@ReportYear AS VARCHAR);
PRINT 'Total Working Days: ' + CAST(@TotalDays AS VARCHAR);
PRINT 'Present Days: ' + CAST(@PresentDays AS VARCHAR);
PRINT 'Leave Days: ' + CAST(@LeaveDays AS VARCHAR);
PRINT 'Absent Days: ' + CAST(@AbsentDays AS VARCHAR);

-----------> Output
Employees Attendace Report:
Report Month: 7
Report Year: 2023
Total Working Days: 31
Present Days: 2
Leave Days: 0
Absent Days: 0
