using System;
using System.Data.SqlClient;
using System.Data;


public class CaseWithGruopBy
{
    static string ConnectionString = @"Server=.; DataBase=C21_DB1; User ID = sa; Password=sa123456;";

    private static DataTable GetALLEmployees()
    {
        DataTable dt = new DataTable();

        try
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string Query = "Select * From Employees2";
                connection.Open();

                using (SqlCommand command = new SqlCommand(Query, connection))
                {
                    using (SqlDataReader Reader = command.ExecuteReader())
                    {
                        if (Reader.HasRows)
                        {
                            dt.Load(Reader);
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

        return dt;
    }

    private static void ListAllEmployees(DataTable dt)
    {

        foreach (DataRow dr in dt.Rows)
        {

            Console.WriteLine($"{((string)dr["Name"]).PadRight(20)} {((string)dr["Department"]).PadRight(15)} {((int)dr["Salary"]):C}{(((int)dr["PerformanceRating"])).ToString().PadLeft(10)}");
        }
    }

    private static void AddColumnToTable(ref DataTable dt)
    {
        dt = GetALLEmployees();

        if (!dt.Columns.Contains("PerformansCategory"))
        {
            dt.Columns.Add("PerformansCategory", typeof(string));
        }
    }

    /// <summary>
    /// Set Performance Category
    /// </summary>
    /// <param name="dataTable"></param>
    /// <returns>DataTable(Employees), HighCount, MediumCount, LowCount</returns>
    private static (DataTable, int, int, int, int, int, int) SetPerformanceCategory()
    {
        DataTable dataTable = new DataTable();

        AddColumnToTable(ref dataTable);

        int Performans = 0;
        int HighCount = 0;
        int LowCount = 0;
        int MediumCount = 0;
        int HSalary = 0;
        int MSalary = 0;
        int LSalary = 0;

        foreach(DataRow dr in dataTable.Rows)
        {
            Performans = (int)dr["PerformanceRating"];

            if (Performans >= 80)
            {
                dr["PerformansCategory"] = "High";
                HSalary += (int)dr["Salary"]; 
                HighCount++;
            }
            else if (Performans >= 60) 
            {
                dr["PerformansCategory"] = "Medium";
                MSalary += (int)dr["Salary"];
                MediumCount++;
            }
            else
            {
                dr["PerformansCategory"] = "Low";
                LSalary += (int)dr["Salary"];
                LowCount++;
                    
            }
        }

        return (dataTable, HighCount, MediumCount, LowCount, HSalary, MSalary, LSalary);
    }

    public static void PrintAllResults()
    {
        DataTable dt = new DataTable();
        (DataTable, int, int, int, int, int, int) tplResult = SetPerformanceCategory();
        dt = tplResult.Item1;
        int LCount = tplResult.Item4;   
        int MCount = tplResult.Item3;   
        int HCount = tplResult.Item2;
        int HSalary = tplResult.Item5;
        int MSalary = tplResult.Item6;
        int LSalary = tplResult.Item7;

        Console.WriteLine("-----------------------------------------");
        if (HCount > 0)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine($"Hight\t\t{HCount}\t\t{HSalary/HCount}");
        }
        if (MCount > 0)
        {
            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine($"Medium\t\t{MCount}\t\t{MSalary / MCount}");
        }
        if (LCount > 0)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine($"Low\t\t{HCount}\t\t{HSalary / HCount}");
        }
        Console.WriteLine("-----------------------------------------");

    }

}

/*
---------------------------------------------------------------------------------------
Use C21_DB1

SELECT PerformanceCategory, COUNT(*) AS NumberOfEmployees, AVG(Salary) AS AverageSalary FROM
(
	SELECT Name, Salary, CASE 
							WHEN PerformanceRating >= 80 THEN 'High'
							WHEN PerformanceRating >= 60 THEN 'Medium'
							ELSE 'Low'
						 END AS PerformanceCategory
	FROM Employees2
) AS PerformanceTable
GROUP BY PerformanceCategory
---------------------------------------------------------------------------------------
SELECT EmployeeID, Count(*) As PersentDays FROM
(
	SELECT EmployeeID FROM EmployeeAttendance WHERE Status ='Present'
) AS t
GROUP BY EmployeeID
---------------------------------------------------------------------------------------
SELECT EmployeeID, 
COUNT(CASE WHEN Status = 'Present' THEN 1 END) As PersentDays 
FROM EmployeeAttendance
GROUP BY EmployeeID
---------------------------------------------------------------------------------------
SELECT EmployeeID, 
SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) As PersentDays 
FROM EmployeeAttendance
GROUP BY EmployeeID
---------------------------------------------------------------------------------------
*/
