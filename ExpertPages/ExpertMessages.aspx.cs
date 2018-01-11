using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string command = "SELECT * FROM MESSAGES WHERE ThreadId = @ThreadId ORDER BY DateTime";
        rpt_Table.DataSource = GetMessages(command);
        rpt_Table.DataBind();

        var solved = Inbox.checkifSolved(Session["Thread"].ToString());
        if (solved)
        {
            tb_Reply.Visible = false;
            btn_Reply.Visible = false;
        }

    }

    public DataTable GetMessages(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtMsg = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@ThreadId", Session["Thread"]);
        da.Fill(dtMsg);
        con.Close();
        return dtMsg;
    }
    protected void btn_Reply_Click(object sender, EventArgs e)
    {
        string datetime = DateTime.Now.ToString("yyyy-MM-dd  HH:mm:ss");
        Inbox.insertExpertMessage(Convert.ToInt32(Session["Thread"]), tb_Reply.Text, Convert.ToInt32(Session["ExpertId"]), Convert.ToDateTime(datetime));
        Response.Redirect("~/ExpertPages/ExpertMessages.aspx");
    }
}