using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for FAQ
/// </summary>
public class FAQ
{

    
    private string _FAQID = null;
    private string _userid = null;
    private string _question = "";
    private string _answer = "";
    public FAQ()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public FAQ(string FAQID, string userid, string question, string answer)
    {
        _FAQID = FAQID;
        _userid = userid;
        _question = question;
        _answer = answer;
    }
    // Constructor that take in all except FAQID
    public FAQ(string userid, string question, string answer):this(null, userid, question, answer)
    {

    }
    // Constructor that take in only FAQID. The other attributes will be set to 0 or empty.
    public FAQ(string FAQId):this(FAQId, "", "", "")
    {

    }

    public string FAQID
    {
        get { return _FAQID; }
        set { _FAQID = value; }
    }

    public string UserId
    {
        get { return _userid; }
        set { _userid = value; }
    }

    public string Question
    {
        get { return _question; }
        set { _question = value; }
    }

    public string Answer
    {
        get { return _answer; }
        set { _answer = value; }
    }

    public FAQ getQuestion(string FAQId)
    {
        FAQ FAQDetail = null;
        string userid, question, answer;
        string queryStr = "SELECT * FROM FAQ WHERE FAQID = @FAQID";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@FAQID", FAQID);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Check if there are any resultsets
        if (dr.Read())
            {
                userid = dr["UserId"].ToString();
                question = dr["Question"].ToString();
                answer = dr["Answer"].ToString();
           
            }
            else
            {
                FAQDetail = null;
            }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return FAQDetail;
    }

    public List<FAQ> getFAQAll()
    {
        List<FAQ> FAQList = new List<FAQ>();
        string FAQID, userid, question, answer;
        string queryStr = "SELECT * FROM FAQ Order by FAQID";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            FAQID = dr["FAQID"].ToString();
            userid = dr["UserId"].ToString();
            question = dr["Question"].ToString();
            answer = dr["Answer"].ToString();
            FAQ a = new FAQ(FAQID, userid, question, answer);
            FAQList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return FAQList;
    }

    public List<FAQ> getFAQAnswered()
    {
        List<FAQ> FAQList = new List<FAQ>();
        string FAQID, userid, question, answer;
        string queryStr = "SELECT * FROM FAQ WHERE Answer IS NOT NULL";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            FAQID = dr["FAQID"].ToString();
            userid = dr["UserId"].ToString();
            question = dr["Question"].ToString();
            answer = dr["Answer"].ToString();
            FAQ a = new FAQ(FAQID, userid, question, answer);
            FAQList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return FAQList;
    }


    public List<FAQ> getFAQUnanswered()
    {
        List<FAQ> FAQList = new List<FAQ>();
        string FAQID, userid, question, answer;
        string queryStr = "SELECT * FROM FAQ WHERE Answer IS NULL";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            FAQID = dr["FAQID"].ToString();
            userid = dr["UserId"].ToString();
            question = dr["Question"].ToString();
            answer = dr["Answer"].ToString();
            FAQ a = new FAQ(FAQID, userid, question, answer);
            FAQList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return FAQList;
    }

    public List<FAQ> getFAQSearch()
    {
        List<FAQ> FAQList = new List<FAQ>();
        string FAQID, userid, question, answer;
        string queryStr = "SELECT * FROM FAQ WHERE Question LIKE '%'";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            FAQID = dr["FAQID"].ToString();
            userid = dr["UserId"].ToString();
            question = dr["Question"].ToString();
            answer = dr["Answer"].ToString();
            FAQ a = new FAQ(FAQID, userid, question, answer);
            FAQList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return FAQList;
    }

    public int FAQInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr = "INSERT INTO FAQ(FAQID, UserId, Question, Answer)"
        + "values (@FAQID,@UserId, @Question, @Answer)";
       
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@FAQID", this.FAQID);
        cmd.Parameters.AddWithValue("@UserId", this.UserId);
        cmd.Parameters.AddWithValue("@Question", this.Question);
        if (String.IsNullOrEmpty(this.Answer))
        {
            cmd.Parameters.AddWithValue("@Answer", DBNull.Value);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Answer", this.Answer);
        }
        conn.Open();
        result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
        conn.Close();
        return result;
    }//end Insert

    public int FAQDelete(string ID)
    {
        string queryStr = "DELETE FROM FAQ WHERE FAQID=@ID";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }//end Delete

    public int FAQUpdate(string fId, string fAnswer)
    {
        string queryStr = "UPDATE FAQ SET " +
        "Answer = @Answer " +
        "WHERE FAQID = @FAQID";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@FAQID", fId);
        if (String.IsNullOrEmpty(fAnswer))
        {
            cmd.Parameters.AddWithValue("@Answer", DBNull.Value);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Answer", fAnswer);
        }
        
      
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }//end Update

}