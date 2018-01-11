using System;

using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string orderNo;
            if (string.IsNullOrEmpty(tb_OrderNo.Text))
        {
            orderNo = "N/A";
        }
            else
        {
            orderNo = tb_OrderNo.Text;
        }
        try {
            if (Page.IsValid) {

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("btymhelp@gmail.com");
                mailMessage.To.Add("btymhelp@gmail.com");
                mailMessage.Subject = tb_Subject.Text;

                mailMessage.Body = "<b>Sender Name: </b>" + tb_FName.Text + "&nbsp;" + tb_LName.Text + "<br/>" +
                                   "<b>Sender Email: </b>" + tb_Email.Text + "<br/>" +
                                   "<b>Sender Order No: </b>" + orderNo + "<br/>" +
                                   "<b>Comments: </b>" + tb_Comments.Text + "<br/>";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                smtpClient.Send(mailMessage);

                control.ForeColor = System.Drawing.Color.Blue;
                control.Text = "Thank you for Contacting Us";
                tb_FName.Enabled = false;
                tb_LName.Enabled = false;
                tb_Email.Enabled = false;
                tb_OrderNo.Enabled = false;
                tb_Subject.Enabled = false;
                tb_Comments.Enabled = false;
                btnSubmit.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = "An unknown error occured. Please try again later.";
        }
        }
    }

