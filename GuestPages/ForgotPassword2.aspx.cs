using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword2 : System.Web.UI.Page
{

    Models.Expert exp = new Models.Expert();
    Models.Expert expDetails = new Models.Expert();
    protected void Page_Load(object sender, EventArgs e)
    {
        expDetails = exp.getExpert(Session["Email"].ToString());
        lblUsername.Text = expDetails.ExpUserName;

        if (lblUsername.Text != null)
        {
            //Retrieve username from session
            lblWelcome.Text = "Hi, " + lblUsername.Text + " !";
        }
        else
        {
            //do something else
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        
        SqlConnection connect = new SqlConnection(DbHelper.ConnectionString);
        string UpdateQuery = "UPDATE Expert SET Password =  @Password WHERE UserName = @UserName";
        SqlCommand com = new SqlCommand(UpdateQuery, connect);
        com.Parameters.AddWithValue("@UserName", lblUsername.Text);
        com.Parameters.AddWithValue("@Password", tbNewPwd.Text);
        connect.Open();
        com.ExecuteNonQuery();
        connect.Close();
        lblMessage.Text = "Password Changed Successfully!";
        connect.Close();
    }
}