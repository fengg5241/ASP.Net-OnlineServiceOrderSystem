using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Rewards
/// </summary>
public class Coupon
{
    public static string generateReward(int length)
    {
       char[] chars = "QWERTYUIOPASDFGHJKLMZNXBCV1234567890".ToCharArray();
       Random random = new Random();
       var result = new string(
           Enumerable.Repeat(chars, length)
                     .Select(s => s[random.Next(s.Length)])
                     .ToArray());

        return result;
    }
    
    public static bool checkPoints(int balance, int points)
    {
        if (balance > points)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool checkDuplicate(string code)
    {
        int feedback;
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string query = "SELECT COUNT(*) FROM [Coupons] WHERE (CouponCode) = @cc ";
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@cc", code);
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        if(feedback > 0)
        {
            con.Close();
            return false;
        }
        else
        {
            con.Close();
            return true;
        }
        
    }

    public static int storeCoupon(string code, string type, string status, string userid)
    {

        int feedback = 0;
        string query = "INSERT INTO [Coupons](CouponCode,CouponType,Status, UserId) VALUES (@cc,@ct,@Status,@UserId)";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@cc", code);
        cmd.Parameters.AddWithValue("@ct", type);
        cmd.Parameters.AddWithValue("@status", status);
        cmd.Parameters.AddWithValue("@UserId", userid);

        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }

    public static int deductPoints(int cost, string userid)
    {
        int feedback = 0;
        string query = "UPDATE [User] SET Points = Points - @newbalance WHERE Id = @UserId";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@newbalance", cost);
        cmd.Parameters.AddWithValue("@UserId", userid);
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }

    public static int pointsEarned(decimal price)
    {
        decimal points = Math.Round(price, 0) ;
        int pointsGot = Convert.ToInt32(points);
        return pointsGot;
    }

    public static int insertNewPoints(int pointsEarned, int userId)
    {
        int feedback = 0;
        string query = "UPDATE [User] SET (Points) + @PointsEarned WHERE (Id) = @Id ";//cmd.Parameters.AddWithValue("@Id", Session["UserId");
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@PointsEarned", pointsEarned);
        cmd.Parameters.AddWithValue("@Id", userId);
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }

    public static decimal getDiscount(string code)
    { 
        DataTable dt = new DataTable();
        string query = "SELECT CouponType FROM [Coupons] WHERE CouponCode = @ccCode";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@ccCode", code);
        cmd.CommandText = query;
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
        sqlDa.Fill(dt);
        decimal discount = 0.00m;
        if (dt.Rows.Count > 0)
        {
            string Type = dt.Rows[0]["CouponType"].ToString();
            if (Type.Equals("5"))
            {
                discount = 5.00m;
            }
            else if (Type.Equals("10"))
            {
                discount = 10.00m;
            }
            else if (Type.Equals("15"))
            {
                discount = 15.00m;
            }
            else if (Type.Equals("20"))
            {
                discount = 20.00m;
            }
            con.Close();
            return discount;
        }
       else
        {
            con.Close();
            return discount;
        } 
    }
   
    public static bool checkCodeExists(string code)
    {
        int feedback;
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string query = "SELECT COUNT(*) FROM [Coupons] WHERE (CouponCode) = @cc AND (Status) = @Status";
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@cc", code);
        cmd.Parameters.AddWithValue("@Status", "unused");
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        if (feedback < 1)
        {
            con.Close();
            return false;
        }
        else
        {
            con.Close();
            return true;
        }
        
    }

    public static int setUsed(string code)
    {
        int feedback;
        string query = "UPDATE [Coupons] SET Status = @Status WHERE CouponCode = @ccCode" ;
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Parameters.AddWithValue("@Status", "used");
        cmd1.Parameters.AddWithValue("@ccCode", code);
        cmd1.Connection = con;
        cmd1.CommandText = query;

        con.Open();
        feedback = cmd1.ExecuteNonQuery();
        con.Close();
        return feedback;
        
    }

    public static int seeAvaliable(string userid)
    {
        int feedback = 0;
        string query = "SELECT COUNT(CouponCode) FROM [Coupons] WHERE UserId = @UserId AND Status = @Status";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Status", "unused");
        cmd.Parameters.AddWithValue("@UserId", userid);
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback = Convert.ToInt32(cmd.ExecuteScalar()); // No of Rows RETURNED
        con.Close();

        return feedback;
    }
}