using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for Receipt
/// </summary>
public class Receipt
{
    protected void Receipt_Load()
    {
        string query1 = "SELECT * FROM [UserAddress] INNER JOIN [Order] ON [UserAddress].Id = [Order].AddressId WHERE [Order].Id = @Id ";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { query1 };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = con;
    }
 
}