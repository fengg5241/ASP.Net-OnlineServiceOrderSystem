using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertLogin : System.Web.UI.Page
{
    Models.Expert exp = new Models.Expert();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from [Expert] where Email=@Email and Password=@Password", con);
        cmd.Parameters.AddWithValue("@Email", tbExpEmail.Text);
        cmd.Parameters.AddWithValue("@Password", tbExpPwd.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Session["ExpertId"] = dt.Rows[0]["Id"].ToString();
            Session["Email"] = tbExpEmail.Text;
            Response.Redirect("~/ExpertPages/ServiceView.aspx");
        }
        else
        {
            lblInfo.Text = "Your email and password is incorrect";
            lblInfo.ForeColor = System.Drawing.Color.Red;

        }


}

    protected void btnExpForgetPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/ForgotPassword1.aspx");
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/ExpertRegistration.aspx");
    }
}