using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Inbox
/// </summary>
public class Inbox
{

   public static int insertUserMessage(int threadId, string Message, int userid, DateTime datetime)
    {
        int feedback = 0;
        string query = "INSERT INTO [Messages](ThreadId,Message,UserId,DateTime,Type,Seen) VALUES (@Thread,@Message,@UserId,@DateTime,@Type,@Seen)";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@UserId", userid);
        cmd.Parameters.AddWithValue("@Thread", threadId);
        cmd.Parameters.AddWithValue("@DateTime", datetime);
        cmd.Parameters.AddWithValue("@Message", Message);
        cmd.Parameters.AddWithValue("@Type", "User");
        cmd.Parameters.AddWithValue("@Seen", "Delivered");
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }
    public static int insertExpertMessage(int threadId, string Message, int expertid, DateTime datetime)
    {
        int feedback = 0;
        string query = "INSERT INTO [Messages](ThreadId,Message,ExpertId,DateTime,Type,Seen) VALUES (@Thread,@Message,@ExpertId,@DateTime,@Type,@Seen)";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@ExpertId", expertid);
        cmd.Parameters.AddWithValue("@Thread", threadId);
        cmd.Parameters.AddWithValue("@DateTime", datetime);
        cmd.Parameters.AddWithValue("@Message", Message);
        cmd.Parameters.AddWithValue("@Type", "Expert");
        cmd.Parameters.AddWithValue("@Seen", "Delivered");
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }

    public static DataTable GetThreads(string query, int Id)
    {
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Id);
        da.Fill(dtOrd);
        return dtOrd;
    }
    public static int insertThread(string title, int UserId, string selection)
    {
        int feedback = 0;
        string query = "INSERT INTO [SupportTicket](Title,UserId,ExpertId,Status,OrderId) VALUES (@Title,@UserId,(SELECT ExpertId FROM [Order] o INNER JOIN [Service] s ON o.ServiceId = s.Id WHERE o.Id = @Selection), @Status, @Selection)";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Title",title);
        cmd.Parameters.AddWithValue("@UserId", UserId);
        cmd.Parameters.AddWithValue("@Selection", selection);
        cmd.Parameters.AddWithValue("@Status", "OPEN");
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        feedback += cmd.ExecuteNonQuery(); // No of Rows Added
        con.Close();

        return feedback;
    }
    public static bool checkDuplicate(string orderId)
    {
        int feedback;
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string query = "SELECT COUNT(*) FROM [SupportTicket] WHERE (OrderId) = @OID ";
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@OID", orderId);
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        if (feedback > 0)
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

    public static int setSolved(string Thread)
    {
        int feedback;
        string query = "UPDATE [SupportTicket] SET Status = @Status WHERE ThreadId = @ThreadId";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Parameters.AddWithValue("@Status", "SOLVED");
        cmd1.Parameters.AddWithValue("@ThreadId", Thread);
        cmd1.Connection = con;
        cmd1.CommandText = query;

        con.Open();
        feedback = cmd1.ExecuteNonQuery();
        con.Close();
        return feedback;

    }

    public static bool checkifSolved(string Thread)
    {
        int feedback;
        string query = "SELECT COUNT(*) FROM SupportTicket WHERE ThreadId = @ThreadId AND Status = @Status ";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@ThreadId", Thread);
        cmd.Parameters.AddWithValue("@Status", "SOLVED");
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        if (feedback > 0)
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }

    public static int userRead(string threadId) //USER READ EXPERT's MESSAGES
    {
        int feedback;
        string query = "UPDATE Messages SET Seen = @Read WHERE ThreadId = @ThreadId AND Type = @Type";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Parameters.AddWithValue("@Read", "READ");
        cmd1.Parameters.AddWithValue("@Type", "Expert");
        cmd1.Parameters.AddWithValue("@ThreadId", threadId);
        cmd1.Connection = con;
        cmd1.CommandText = query;

        con.Open();
        feedback = cmd1.ExecuteNonQuery();
        con.Close();
        return feedback;
    }

    public static int ExpertRead(string threadId) //EXPERT READ USER MESSAGES
    {
        int feedback;
        string query = "UPDATE Messages SET Seen = @Read WHERE ThreadId = @ThreadId AND Type = @Type";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Parameters.AddWithValue("@Read", "READ");
        cmd1.Parameters.AddWithValue("@Type", "User");
        cmd1.Parameters.AddWithValue("@ThreadId", threadId);
        cmd1.Connection = con;
        cmd1.CommandText = query;

        con.Open();
        feedback = cmd1.ExecuteNonQuery();
        con.Close();
        return feedback;
    }

    public static int getUserUnreadCount(string userId) // get no of unread messages for user, meaning expert msg unread
    {
        int feedback;
        string query = "SELECT COUNT([Messages].MessageId) FROM [Messages] LEFT JOIN [SupportTicket] ON [SupportTicket].ThreadId = [Messages].ThreadId WHERE [Messages].Seen = @Seen AND [Messages].Type = @Type AND [SupportTicket].UserId = @Userid";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.Parameters.AddWithValue("@Seen", "Delivered");
        cmd.Parameters.AddWithValue("@Type", "Expert");
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        con.Close();
        return feedback;
    }

    public static int getExpertUnreadCount(string userId) // get no of unread messages for Expet.
    {
        int feedback;
        string query = "SELECT COUNT([Messages].MessageId) FROM [Messages] LEFT JOIN [SupportTicket] ON [SupportTicket].ThreadId = [Messages].ThreadId WHERE [Messages].Seen = @Seen AND [Messages].Type = @Type AND [SupportTicket].ExpertId = @Userid   ";
        
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.Parameters.AddWithValue("@Userid", userId);
        cmd.Parameters.AddWithValue("@Seen", "Delivered");
        cmd.Parameters.AddWithValue("@Type", "User");
        con.Open();
        feedback = (int)cmd.ExecuteScalar();
        con.Close();
        return feedback;
    }

    public static DataTable GetUnread(int Id)
    {
        string query = "SELECT * FROM [SupportTicket] INNER JOIN [Messages] ON [SupportTicket].ThreadId = [Messages].ThreadId WHERE [Messages].Seen = @Seen AND [SupportTicket].ExpertId = @UserId AND [Messages].Type = @Type";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Id);
        da.SelectCommand.Parameters.AddWithValue("@Seen", "Delivered");
        da.SelectCommand.Parameters.AddWithValue("@Type", "User");
        da.Fill(dtOrd);
        return dtOrd;
    }

    public static DataTable GetUserUnread(int Id)
    {
        string query = "SELECT * FROM [SupportTicket] INNER JOIN [Messages] ON [SupportTicket].ThreadId = [Messages].ThreadId WHERE [Messages].Seen = @Seen AND [SupportTicket].UserId = @UserId AND [Messages].Type = @Type";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Id);
        da.SelectCommand.Parameters.AddWithValue("@Type", "Expert");
        da.SelectCommand.Parameters.AddWithValue("@Seen", "Delivered");
        da.Fill(dtOrd);
        return dtOrd;
    }
}