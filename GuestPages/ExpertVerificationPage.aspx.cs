using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

public partial class ExpertVerificationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResendEmail_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("minlithng12@gmail.com"); //GET USER'S EMAIL FROM DATABASE
                mailMessage.To.Add("minli_thng@yahoo.com.sg");
                mailMessage.Subject = "Thank you for signing up with us.";

                //ActivationUrl = Server.HtmlEncode("http://localhost:2671/Important_Testing/Verification.aspx?USER_ID=");
                ///mailMessage.Body = "<a href='" + ActivationUrl + "'>Click Here to verify your acount</a>";

                mailMessage.Body = "You have successfully created your account. Click on this link to complete the activation.";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("minlithng12@gmail.com", "TMl@1998");
                smtpClient.Send(mailMessage);



            }
        }
        catch
        {

        }
    }
}