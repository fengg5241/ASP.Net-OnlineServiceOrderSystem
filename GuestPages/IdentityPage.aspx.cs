using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IdentityPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/UserLogin.aspx");
    }


    protected void btnExpert_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/ExpertLogin.aspx");
    }


    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/AdminLogin.aspx");
    }
}