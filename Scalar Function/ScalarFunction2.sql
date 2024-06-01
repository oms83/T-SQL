-- Scalar function we can use it in a query while a stored procedure cannot use it within the queries



CREATE FUNCTION BounsRating(@name VARCHAR(100))
RETURNS INT
AS 
BEGIN
	DECLARE @PerformanceRating INT;
	DECLARE @Salary INT;
	SELECT @Salary = Salary , @PerformanceRating = PerformanceRating FROM Employees2
	WHERE Name = @name;

	IF @PerformanceRating > 90
		RETURN @Salary * 1.5;
	IF @PerformanceRating > 75
		RETURN @Salary * 1.25;
	IF @PerformanceRating > 60
		RETURN @Salary * 1.15;
	ELSE
		RETURN @Salary * 1.0;

	RETURN @Salary;
END

SELECT *, dbo.BounsRating(Name) AS SalaryWithBouns FROM Employees2




/*
Employee 1	Marketing	119885	81	149856
Employee 2	Marketing	83243	75	95729
Employee 3	HR	78906	80	98632
Employee 4	HR	93279	64	107270
Employee 5	IT	147965	72	170159
Employee 6	HR	333270	96	499905
Employee 7	Marketing	127451	74	146568
Employee 8	HR	141384	75	162591
Employee 9	HR	91444	69	105160
Employee 10	IT	405001	94	607501
Employee 11	Marketing	148810	88	186012
Employee 12	IT	108024	65	124227
Employee 13	HR	118334	65	136084
Employee 14	Marketing	111278	80	139097
Employee 15	IT	306712	92	460068
Employee 16	HR	273375	91	410062
Employee 17	Marketing	62225	66	71558
Employee 18	Marketing	135257	79	169071
Employee 19	Marketing	264453	95	396679
Employee 20	Marketing	151682	78	189602
*/
