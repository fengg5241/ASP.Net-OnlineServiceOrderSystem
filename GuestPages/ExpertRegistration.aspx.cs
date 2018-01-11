using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Net.Mail;

public partial class ExpertRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }


    protected void btnSignIn_Click(object sender, EventArgs e)
    {


        Response.Redirect("~/GuestPages/ExpertLogin.aspx");
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        int result = 0;
        //   Expert exp = new Expert(int.Parse(lblExpertID.Text), tbExpUserName.Text, tbExpFName.Text, tbExpLName.Text, tbExpEmail.Text, tbExpPwd.Text, tbExpPhoneNo.Text, rblExpGender.Text, tbExpAddr1.Text, tbExpAddr2.Text, tbExpPC.Text, ddlDay.Text, ddlMonth.Text, ddlYear.Text);

        try
        {
            Models.Expert exp = new Models.Expert(tbExpUserName.Text, tbExpFName.Text, tbExpLName.Text, tbExpEmail.Text, tbExpPwd.Text, tbExpAddress.Text, tbExpPhoneNo.Text, rblExpGender.SelectedValue);
            result = exp.ExpertInsert();
            Session["ExpertRegistration"] = exp;
            Session["Email"] = tbExpEmail.Text;

            if (Page.IsValid)
            {




                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("btymhelp@gmail.com"); //GET USER'S EMAIL FROM DATABASE
                    mailMessage.To.Add(exp.ExpEmail);
                    mailMessage.Subject = "Thank you for signing up with us.";

                    mailMessage.Body = "You have successfully created your account. Click on this link&nbsp;http://localhost:52050/ExpertPages/ExpertVerifyAccount.aspx &nbsp;to complete the activation.";
                    mailMessage.IsBodyHtml = true;

                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                    smtpClient.Send(mailMessage);
                    

                Response.Redirect("~/GuestPages/ScheduleMeeting.aspx");

            }
        }
        catch
        {

        }


    }
}





