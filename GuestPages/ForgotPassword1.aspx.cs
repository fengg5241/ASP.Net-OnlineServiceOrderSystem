﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class ForgotPassword1 : System.Web.UI.Page
{
    Models.Expert exp = new Models.Expert();
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnEmail_Click(object sender, EventArgs e)
    {
        

  
        try
        {
            if (Page.IsValid)
            {

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("btymhelp@gmail.com"); //GET USER'S EMAIL FROM DATABASE
                mailMessage.To.Add(exp.ExpEmail);
                mailMessage.Subject = "Password Reset Instructions";

                mailMessage.Body = "Here are some steps for us to retrieve your account.";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                smtpClient.Send(mailMessage);

               

            }
        }
        catch
        {

        }

    }


    protected void btnResendEmail_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("btymhelp@gmail.com"); //GET USER'S EMAIL FROM DATABASE
                mailMessage.To.Add(exp.ExpEmail);
                mailMessage.Subject = "Password Reset Instructions";

                mailMessage.Body = "Here are some steps for us to retrieve your account.";
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
                smtpClient.Send(mailMessage);

                Response.Redirect("~/GuestPages/UserVerificationPage.aspx");

            }
        }
        catch
        {

        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from Expert where Email=@Email", con);
        cmd.Parameters.AddWithValue("@Email", tbUserEmail.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Session["Email"] = tbUserEmail.Text;
            Response.Redirect("~/GuestPages/ForgotPassword2.aspx");
        }
        else
        {
            lbl_Message.Text = "Your email is incorrect";
            lbl_Message.ForeColor = System.Drawing.Color.Red;

        }

     
    }
}