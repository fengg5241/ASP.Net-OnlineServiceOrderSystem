using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ScheduleMeeting : System.Web.UI.Page
{
    Models.Expert exp = new Models.Expert();
    protected void Page_Load(object sender, EventArgs e)
    {
        Models.Expert expDetails = new Models.Expert();
        // Get Product ID from querystring
        
        expDetails = exp.getExpert(Session["Email"].ToString());
        lblExpEmail.Text = exp.ExpEmail;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        int result = 0;
        try
        {
            Models.Meeting schedule = new Models.Meeting(tbDate.Text, tbTime.Text);
            result = schedule.MeetingInsert();
            //Session["UserId"] = user.UserId.ToString();
            MailMessage mailMessage = new MailMessage();
            if (Page.IsValid)
            {
             /*   mailMessage.From = new MailAddress("btymhelp@gmail.com");
                //GET USER'S EMAIL FROM DATABASE
                //"btymhelp@gmail.com"
                mailMessage.To.Add(exp.ExpEmail);
                //exp.ExpEmail.ToString()
                mailMessage.Subject = "Thank you for signing up with us.";

                mailMessage.Body = "You have chosen&nbsp;" + tbDate.Text +
                       "&nbsp;and&nbsp;" + tbTime.Text + "&nbsp;as your scheduled appoinment date and time. <br /> Please bring you relevant achievements and qualifications for the interview. <br />" +
                       "<b> Attire: </b> Formal <br />" +
                       "<b> Venue: </b> BTYM Headquarters";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                smtpClient.Send(mailMessage);*/

                Response.Redirect("~/GuestPages/ExpertVerificationPage.aspx");
            }
        }

        catch
        {

        }
    }
}