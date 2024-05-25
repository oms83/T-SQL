using System;
using System.Data;
using System.Data.SqlClient;
internal class Program
{
    static string ConnectionString = @"Server=.; DataBase=C21_DB1; User ID = sa; Password=sa123456;";

    static DataTable GetALLEmployees()
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

    static bool Update(string Name, double ratio)
    {
        int AffcetedRows = 0;
        try
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string Query = @"UPDATE Employees2
                                    SET Salary = Salary * @ratio
                                    WHERE Name = @Name;
                                ";

                connection.Open();

                using (SqlCommand command = new SqlCommand(Query, connection))
                {
                    command.Parameters.AddWithValue("@ratio", ratio);
                    command.Parameters.AddWithValue("@Name", Name);

                    AffcetedRows = command.ExecuteNonQuery();
                }
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

        return (AffcetedRows > 0);
    }

    static void UpdateSalaries(DataTable dtEmployees)
    {
        int Performans = 0;
        int Salary = 0;
        string Name = string.Empty;

        foreach (DataRow dr in dtEmployees.Rows)
        {
            Performans = (int)dr["PerformanceRating"];
            Salary = (int)dr["Salary"];
            Name = (string)dr["Name"];

            if (Performans >= 90)
            {
                Update(Name, 1.25);
            }
            else if (Performans < 90 && Performans > 70)
            {
                Update(Name, 1.15);
            }
            else
            {
                //Nothing
            }
                

        }
    }

    static void ListAllEmployees(DataTable dt)
    {
            
        foreach (DataRow dr in dt.Rows)
        {
                
            Console.WriteLine($"{((string)dr["Name"]).PadRight(20)} {((string)dr["Department"]).PadRight(15)} {((int)dr["Salary"]):C}{(((int)dr["PerformanceRating"])).ToString().PadLeft(10)}");
        }
    }

    static void Main(string[] args)
    {
        DataTable dt = GetALLEmployees();
            
        Console.WriteLine("Befor Updating");
        ListAllEmployees(dt);

        UpdateSalaries(dt);
            
        Console.WriteLine("After Updating");
        ListAllEmployees(dt);
            
        Console.ReadKey();
    }
}
