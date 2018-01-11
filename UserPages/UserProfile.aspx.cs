using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    Models.User user = new Models.User();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string email = (string)Session["Email"];
        Models.User userDetails = new Models.User();
        userDetails = user.getUser(Session["Email"].ToString());

      
        lblUserName.Text = userDetails.UserName;
        lblUserFName.Text = userDetails.UserFName;
        lblUserLName.Text = userDetails.UserLName;
        lblUserEmail.Text = (string)Session["Email"];
        lblUserPhone.Text = userDetails.UserHp;
        lblUserGender.Text = userDetails.UserGender;
        lblUserBirthdate.Text = userDetails.UserDateOfBirth;
      /*  lblUserBirthdate.Text = userDetails.UserDateOfBirth;
        lblUserAddress.Text = userDetails.Address;
        lblUserPostalCode.Text = userDetails.PostalCode;*/
        lblWelcome.Text = userDetails.UserName;

        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand("select Id from [User] where Email=@Email", con);
        //cmd.Parameters.AddWithValue("@Id", lblUserId.Text);
        cmd.Parameters.AddWithValue("@Email", lblUserEmail.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();




        //check whether session is null or not
        if (lblUserName.Text != null)
        {
            //Retrieve username from session
            lblWelcome.Text = "Welcome, " + lblUserName.Text;
        }
        else
        {
            //do something else
        }

   }


    protected void btnEdit_Click(object sender, EventArgs e)
    {

        
        // Redirect to next page, with the Product Id added to the URL,
        // e.g. ProductDetails.aspx?ProdID=1
        //Response.Redirect("UserEditProfile.aspx?Id=" + userId);

        Response.Redirect("~/UserPages/UserEditProfile.aspx");
    }



    protected void btnChange_Click(object sender, EventArgs e)
    {

    }

    protected void saveBtn_Click(object sender, EventArgs e)
    {

        try
        {

            SqlConnection connect = new SqlConnection(DbHelper.ConnectionString);
            string UpdateQuery = "UPDATE [User] SET Password =  @Password WHERE UserName = @UserName";
            SqlCommand com = new SqlCommand(UpdateQuery, connect);
            com.Parameters.AddWithValue("@UserName", lblUserName.Text);
            com.Parameters.AddWithValue("@Password", tbUserCfmPwd.Text);
            connect.Open();
            com.ExecuteNonQuery();
            connect.Close();
            lblCheck.Text = "Password Changed Successfully!";
            connect.Close();
        }
        catch (Exception ex)
        {

        }
    }
}