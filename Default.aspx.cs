using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/IdentityPage.aspx");
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Session["TotalPrice"] = 10.699;
    //    Session["UserId"] = 1;
    //    Session["Thread"] = 1;
    //    Response.Redirect("~/UserPages/OrderForm.aspx");
    //}

    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    Session["TotalPrice"] = 10.699;
    //    Session["UserId"] = 2;
    //    Response.Redirect("~/UserPages/OrderForm.aspx");
    //}

    //protected void Button3_Click(object sender, EventArgs e)
    //{
    //    string business = TextBox1.Text;
    //    //string cancel_url="";
    //    //string return_url="";

    //    StringBuilder paypal = new StringBuilder();
    //    paypal.Append("https://www.google.com.sg/maps/place/Singapore+");
    //    paypal.Append(business);
    //    //paypal.Append("&return_url=" +return_url);

    //    Response.Redirect(paypal.ToString());
    //}
}