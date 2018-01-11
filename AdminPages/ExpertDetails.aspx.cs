using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertDetails : System.Web.UI.Page
{
    Models.Expert exp = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Models.Expert aExp = new Models.Expert();
        // Get Product ID from querystring
        int expID = Convert.ToInt32(Session["ExpertId"]);
        //int expID = int.Parse(Request.QueryString["ExpertId"].ToString());
        exp = aExp.getExpert(expID);
        //Display product details on web form
        lblExpUsername.Text = exp.ExpUserName;
        lblExpFirstName.Text = exp.ExpFName;
        lblExpLastName.Text = exp.ExpLName;
        //   img_Product.ImageUrl = "~\\Images\\" + prod.Product_Image;
        //Store the value in invsible fields
        lblExpEmail.Text = exp.ExpEmail;
        lblExpPhoneNumber.Text = exp.ExpHp;
        lblExpGender.Text = exp.ExpGender.ToString();
        lblExpId.Text = expID.ToString();
    }

    protected void btnAccept_Click(object sender, ImageClickEventArgs e)
    {
        bool IsEnabled = false;
        //Enable Expert to Login
        if (IsEnabled == true)
        {
            //Send Email to notify Expert that he/she can login
        }
    }

    protected void btnReject_Click(object sender, ImageClickEventArgs e)
    {
        //Hold Expert's account preventing them from logging in 
        //Schedule another meeting
    }
}