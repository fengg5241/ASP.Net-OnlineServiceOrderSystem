using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Reviews
/// </summary>
public class Reviews
{
    
    private string _userid = null;
    private int _rating = 0;
    private string _reviewComments = "";
    
    public Reviews()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //Constructor that takes all that is necessary to build a review object
    public Reviews(string userid, int rating, string reviewComments)
    {
        _userid = userid;
        _rating = rating;
        _reviewComments = reviewComments;
    }
    //Constructor that takes in all except userid
    public Reviews(int rating, string reviewComments):this(null, rating, reviewComments)
    {

    }
    //Constructor that takes in only userid. The other attributes will be set to 0 or empty.
    public Reviews(string userid):this(userid, 0, "")
    {

    }

    public string UserId
    {
        get { return _userid; }
        set { _userid = value; }
    }
    public int Rating
    {
        get { return _rating; }
        set { _rating = value; }
    }

   

    public string reviewComments
    {
        get { return _reviewComments; }
        set { _reviewComments = value; }
    }


    public Reviews getReviews(string userid)
    {
        Reviews reviewDetail = null;
        string reviewComments;
        int rating;
        string queryStr = "SELECT * FROM Reviews WHERE UserId = @userid";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@userid", userid);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Check if there are any resultsets
        if (dr.Read())
        {
            rating = int.Parse(dr["Rating"].ToString());
            reviewComments = dr["ReviewComments"].ToString();
            reviewDetail = new Reviews(userid, rating, reviewComments);
        }
        else
        {
            reviewDetail = null;
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return reviewDetail;
    }

    public List<Reviews> getReviewsAll()
    {
        List<Reviews> reviewList = new List<Reviews>();
        int rating;
        string userid, reviewComments;
        string queryStr = "SELECT * FROM Reviews Order by userid";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            userid = dr["UserId"].ToString();
            rating = int.Parse(dr["Rating"].ToString());
            reviewComments = dr["ReviewComments"].ToString();
            Reviews a = new Reviews(userid, rating, reviewComments);
            reviewList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return reviewList;
    }

    public int ReviewsInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr = "INSERT INTO Reviews(UserId,Rating,ReviewComments)"
        + "values (@UserId,@Rating,@ReviewComments)";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
             SqlCommand cmd = new SqlCommand(queryStr, conn);
             cmd.Parameters.AddWithValue("@UserId", this.UserId);
             cmd.Parameters.AddWithValue("@Rating", this.Rating);
             cmd.Parameters.AddWithValue("@ReviewComments", this.reviewComments);
        conn.Open();
        result += cmd.ExecuteNonQuery(); //Returns no. of rows affected.Must be > 0
        conn.Close();
        return result;
    }//end insert

    public int ReviewsDelete(string ID)
    {
        string queryStr = "DELETE FROM Reviews WHERE UserId=@ID";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }//end Delete
}