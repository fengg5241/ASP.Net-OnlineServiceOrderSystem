using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertProfile : System.Web.UI.Page
{
    Models.Expert exp = new Models.Expert();
    protected void Page_Load(object sender, EventArgs e)
    {
        Models.Expert expDetails = new Models.Expert();
        
        expDetails = exp.getExpert(Session["Email"].ToString());
        lblExpUserName.Text = expDetails.ExpUserName;
        lblExpFName.Text = expDetails.ExpFName;
        lblExpLName.Text = expDetails.ExpLName;
        lblExpEmail.Text = (string)Session["Email"];
        lblExpAddr.Text = expDetails.ExpAddress;
        lblExpPhone.Text = expDetails.ExpHp;
        lblExpGender.Text = expDetails.ExpGender;
        lblWelcome.Text = expDetails.ExpUserName;
        
        String strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        SqlCommand cmd = new SqlCommand("select Id from Expert where Email=@Email", con);
        //cmd.Parameters.AddWithValue("@Id", lblUserId.Text);
        cmd.Parameters.AddWithValue("@Email", lblExpEmail.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();

        //check whether session is null or not
        if (lblExpUserName.Text != null)
        {
            //Retrieve username from session
            lblWelcome.Text = "Welcome, " + lblExpUserName.Text;
        }
        else
        {
            //do something else
        }
    }



    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ExpertPages/ExpertEditProfile.aspx");
    }

    protected void saveBtn_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection connect = new SqlConnection(DbHelper.ConnectionString);
            string UpdateQuery = "UPDATE Expert SET Password =  @Password WHERE UserName = @UserName";
            SqlCommand com = new SqlCommand(UpdateQuery, connect);
            com.Parameters.AddWithValue("@UserName", lblExpUserName.Text);
            com.Parameters.AddWithValue("@Password", tbUserCfmPwd.Text);
            connect.Open();
            com.ExecuteNonQuery();
            connect.Close();
            lblCheck.Text = "Password Changed Successfully!";
        }
        catch (Exception ex)
        {

        }
    }
}