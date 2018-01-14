using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for Expert
/// </summary>
public class BlockList
{
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    private int id;
    private string userName;

    private string gender;
    private string dateOfBirth;

    private string email;
    private Boolean enabled;




    public int Id
    {
        get
        {
            return id;
        }

        set
        {
            id = value;
        }
    }

    public string UserName
    {
        get
        {
            return userName;
        }

        set
        {
            userName = value;
        }
    }




    public string Gender
    {
        get
        {
            return gender;
        }

        set
        {
            gender = value;
        }
    }

    public string DateOfBirth
    {
        get
        {
            return dateOfBirth;
        }

        set
        {
            dateOfBirth = value;
        }
    }



    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    public Boolean Enabled
    {
        get
        {
            return enabled;
        }

        set
        {
            enabled = value;
        }
    }



    public BlockList()
    {

    }

    public BlockList(int id, string userName, string gender, string dateOfBirth, string email, Boolean enabled)
    {
        this.id = id;
        this.userName = userName;

        this.gender = gender;
        this.dateOfBirth = dateOfBirth;

        this.email = email;
        this.enabled = enabled;

    }

    public BlockList getBlockList(int id)
    {
        BlockList block = null;
        string UserName, Gender, DateOfBirth, Email;
        
        int Id;
        Boolean Enabled;
        string queryStr = "SELECT * FROM Expert WHERE Id = @Id";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@Id", id);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Id = int.Parse(dr["Id"].ToString());
            UserName = dr["UserName"].ToString();

            Gender = dr["Gender"].ToString();
            DateOfBirth = dr["DateOfBirth"].ToString();

            Email = dr["Email"].ToString();
            Enabled = Convert.ToBoolean(dr["Enabled"]);

            block = new BlockList(Id, UserName, Gender, DateOfBirth, Email, Enabled);
        }
        else
        {
            block = null;
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return block;
    }

    public List<BlockList> getBlockListAll()
    {
        List<BlockList> blockList = new List<BlockList>();
        string UserName, Gender, DateOfBirth, Email;
         

        int Id;
        string queryStr = "SELECT * FROM Expert Order By Id";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            Id = int.Parse(reader["Id"].ToString());
            UserName = reader["UserName"].ToString();

            Gender = reader["Gender"].ToString();
            DateOfBirth = reader["DateOfBirth"].ToString();

            Email = reader["Email"].ToString();
            object objEnabled = reader["Enabled"];
            Enabled = (objEnabled.GetType() != typeof(DBNull)) ? Convert.ToBoolean(objEnabled) : false;

            BlockList bl = new BlockList(Id, UserName, Gender, DateOfBirth, Email, Enabled);
            blockList.Add(bl);
        }
        conn.Close();
        reader.Close();
        reader.Dispose();
        return blockList;
    }


    public int BlockListUpdate(int id, Boolean enabled)
    {
        string queryStr = "UPDATE Expert SET" + " Enabled=@enabled " + " WHERE  Id = @id";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@Id", id);
        cmd.Parameters.AddWithValue("@Enabled", enabled);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;

    }
}






