using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUserForgetPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/UserForgotPassword1.aspx");
    }



    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        // SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=Z:\\ITP281\\ServiceWebsite_Project\\App_Data\\ServiceOrder.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from [User] where Email=@Email and Password=@Password", con);
        cmd.Parameters.AddWithValue("@Email", tbUserEmail.Text);
        cmd.Parameters.AddWithValue("@Password", tbUserPwd.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Session["UserId"] = dt.Rows[0]["Id"].ToString();
            Session["Email"] = tbUserEmail.Text;
            Response.Redirect("~/UserPages/Homepage.aspx");
        }
        else
        {
            lblCheck.Text = "Your email and password is incorrect";
            lblCheck.ForeColor = System.Drawing.Color.Red;

        }
    }

    protected void BtnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/UserSignup.aspx");
    }
}