DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-01-30';

WITH DateSeries AS 
(
	SELECT @StartDate AS DateValue

	UNION ALL 

	SELECT DATEADD(DAY, 1, DateValue) AS ONE FROM DateSeries WHERE DateValue<@EndDate
)
SELECT * FROM DateSeries
