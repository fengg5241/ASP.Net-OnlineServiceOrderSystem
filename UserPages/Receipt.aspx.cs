using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Receipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int orderId = Convert.ToInt32(Session["OrderId"]);
            Address_Load(orderId);
            Card_Load(orderId);
            Order_Load(orderId);
        }
    }

    protected void Address_Load(int id)
    {
        DataTable dt = new DataTable();
        string query1 = "SELECT * FROM [Order] INNER JOIN [UserAddress] ON [UserAddress].Id = [Order].AddressId  WHERE [Order].Id = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { query1 };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Id", id );
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

        sqlDa.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            lbl_OrderId.Text = id.ToString();

            lbl_Name.Text = dt.Rows[0]["FName"].ToString() +" " + dt.Rows[0]["LName"].ToString(); ;
            lbl_AddressLine1.Text = dt.Rows[0]["AddressLine1"].ToString();
            lbl_AddressLine2.Text = dt.Rows[0]["AddressLine2"].ToString();
            lbl_PostalCode.Text = dt.Rows[0]["Postcode"].ToString();
            lbl_ContactNo.Text = dt.Rows[0]["ContactNo"].ToString();
        }
        con.Close();
        con.Dispose();
    }
    protected void Card_Load(int id)
    {
        DataTable dt = new DataTable();
        string query1 = "SELECT * FROM [Order] INNER JOIN [UserPayment] ON [UserPayment].Id = [Order].CardId  WHERE [Order].Id = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { query1 };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Id", id);
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

        sqlDa.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            lbl_OrderId.Text = id.ToString();

            lbl_CardNo.Text = dt.Rows[0]["CardNo"].ToString();
            lbl_CardName.Text = dt.Rows[0]["Name"].ToString();
            lbl_CardType.Text = dt.Rows[0]["CardType"].ToString();
            lbl_Expiry.Text = dt.Rows[0]["ExpiryMonth"].ToString() + "/" + dt.Rows[0]["ExpiryYear"].ToString();
        }
        con.Close();
        con.Dispose();

    }
    
    protected void Order_Load(int id)
    {
        DataTable dt = new DataTable();
        string query1 = "SELECT * FROM [Order] o INNER JOIN [Service] s ON o.ServiceId = s.Id INNER JOIN [Expert] e ON e.Id = s.ExpertId WHERE o.Id = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { query1 };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Id", id );
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

        sqlDa.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            lbl_OrderName.Text = dt.Rows[0]["FirstName"].ToString() +" " + dt.Rows[0]["LastName"].ToString(); ;
            lbl_Service.Text = dt.Rows[0]["Type"].ToString();
            lbl_Duration.Text = dt.Rows[0]["Duration"].ToString();
            lbl_Created.Text = dt.Rows[0]["CreatedDateTime"].ToString();
            decimal price = Convert.ToDecimal(dt.Rows[0]["Price"]);
            lbl_Price.Text = "$" + Math.Round(price,2).ToString();
            lbl_PointsEarned.Text = dt.Rows[0]["PointsEarned"].ToString();
            lbl_CouponUsed.Text = dt.Rows[0]["CouponUsed"].ToString();
        }
        con.Close();
        con.Dispose();
    }

    protected void btn_Google_Click(object sender, EventArgs e)
    {
        string link = ViewinMaps.loadMap(lbl_PostalCode.Text);
        Response.Write("<script>");
        Response.Write("window.open('" +link +"' ,'_blank')");
        Response.Write("</script>");
    }
}

