using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminLogin : System.Web.UI.Page
{
    private String username;
    public String password;
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnLogin_Click(object sender, EventArgs e)
    {

     

        Boolean hasError = false;

        //
        String id = tbAdminId.Text;
        if (tbAdminId.Text.Equals("Administrator"))
        {

            lblMessage.ForeColor = System.Drawing.Color.Blue;
            lblMessage.Text = ("Correct ID.");
        }
        else if (tbAdminId.Text != "Administrator")
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = ("Wrong Id! Please try again.");
            hasError = true;
        }


        String password = tbAdminPwd.Text;
        if (tbAdminPwd.Text.Equals("Admin2017"))
        {
            lblCheck.ForeColor = System.Drawing.Color.Blue;
            lblCheck.Text = ("Password is correct.");
            

        }
        else if (tbAdminPwd.Text != "Admin2017")
        {
            lblCheck.ForeColor = System.Drawing.Color.Red;
            lblCheck.Text = ("Password is wrong. Please try again.");
            hasError = true;
        }
        if (tbAdminPwd.Text == "")
        {
            lblCheck.ForeColor = System.Drawing.Color.HotPink;
            lblCheck.Text = ("Please enter a password.");
            hasError = true;

        }

        if (hasError == false)
        {
            Response.Redirect("~/AdminPages/AdminHome.aspx");
        }
    }
}