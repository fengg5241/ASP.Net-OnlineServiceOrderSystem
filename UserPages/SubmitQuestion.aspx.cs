using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SubmitQuestion : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("SubmitQuestion.aspx");
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string FAQID = Guid.NewGuid().ToString();
        string userid = (string)Session["Email"].ToString();
        string answer = null;

        if (String.IsNullOrWhiteSpace(tb_Question.Text))
        {
            string message = "Please write a question.";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
        }
        else
        {
            int result = 0;
            FAQ qna = new FAQ(FAQID, userid, tb_Question.Text, answer);
            result = qna.FAQInsert();

            if (result > 0)
            {
                Response.Write("<script>alert('Your question has been submitted.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error. Please Try Again.');</script>");
            }
            Response.Redirect("CustomerFAQ.aspx");
        }
    }
}