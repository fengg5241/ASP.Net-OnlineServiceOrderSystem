using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDetails : System.Web.UI.Page
{
    Models.User user = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Models.User aUser = new Models.User();
        // Get Product ID from querystring
        int userID = int.Parse(Request.QueryString["ID"].ToString());
        user = aUser.getUser(userID);
        //Display product details on web form
        lbl_UserName.Text = user.UserName;
        lbl_UserEmail.Text = user.UserEmail;
        lbl_UserPhoneNo.Text = user.UserHp;
        //   img_Product.ImageUrl = "~\\Images\\" + prod.Product_Image;
        //Store the value in invsible fields
        lblUserGender.Text = user.UserGender.ToString();
        lbl_UserID.Text = userID.ToString();

    }
}