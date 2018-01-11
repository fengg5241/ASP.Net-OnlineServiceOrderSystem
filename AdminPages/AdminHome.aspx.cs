using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnManageExp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPages/ViewExpertDetails.aspx");
    }

    protected void btnManageUsers_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPages/ViewUserDetails.aspx");
    }
}