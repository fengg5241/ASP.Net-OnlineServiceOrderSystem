using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Data.SqlClient;

public partial class UserSignup : System.Web.UI.Page
{
    Models.User aUser = null;
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    /*  public enum Status
      {
          New = 10,
          Old = 20,
          Actual = 30,

          // Use Status.Default to specify default status in your code. 
          Default = New
      }*/

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GuestPages/UserLogin.aspx");
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        //extract info from textbox and save it into session with keyword CustName
        Session["UserName"] = tbUserName.Text;
        Session["FirstName"] = tbUserFName.Text;
        Session["LastName"] = tbUserLName.Text;
        Session["Phone"] = tbUserPhoneNo.Text;
        Session["Email"] = tbUserEmail.Text;

        //if rbl_grnder is selected, selected index will be more than 1
        string gender = null;
        if (rblUserGender.SelectedIndex > -1)
        {
            gender = rblUserGender.SelectedItem.Text;
            Session["Gender"] = gender;
        }

        int result = 0;
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        try
        {
            Models.User user = new Models.User(tbUserName.Text, tbUserFName.Text, tbUserLName.Text, tbUserEmail.Text, tbUserPwd.Text, tbDateOfBirth.Text, tbUserPhoneNo.Text, rblUserGender.SelectedItem.Text);
            result = user.UserInsert();
            Session["UserRegistration"] = user;
            //Session["UserId"] = user.UserId.ToString();

            if (Page.IsValid)
            {

                Models.User userDetails = new Models.User();
                userDetails = user.getUser(Session["Email"].ToString());

               /* MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("btymhelp@gmail.com"); //GET USER'S EMAIL FROM DATABASE
                mailMessage.To.Add(user.UserEmail);
                mailMessage.Subject = "Thank you for signing up with us.";

                mailMessage.Body = "You have successfully created your account. Click on this link&nbsp;http://localhost:52050/GuestPages/UserVerifyAccount.aspx &nbsp;to complete the activation.";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                smtpClient.Send(mailMessage);*/
                
                Response.Redirect("~/GuestPages/UserVerificationPage.aspx");

            }
        }
        catch
        {

        }


    


    }


}