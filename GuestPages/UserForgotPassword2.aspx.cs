using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserForgotPassword2 : System.Web.UI.Page
{
    Models.User user = new Models.User();
    Models.User userDetails = new Models.User();
    protected void Page_Load(object sender, EventArgs e)
    {
        userDetails = user.getUser(Session["Email"].ToString());
        lblUsername.Text = userDetails.UserName;

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
        string UpdateQuery = "UPDATE [User] SET Password =  @Password WHERE UserName = @UserName";
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