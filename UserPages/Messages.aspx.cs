using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Messsages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string command = "SELECT * FROM [MESSAGES] LEFT JOIN [Expert] ON [Expert].Id = [Messages].ExpertId WHERE [Messages].ThreadId = @ThreadId ORDER BY DateTime";
        rpt_Table.DataSource = GetMessages(command);
        rpt_Table.DataBind();

        var solved = Inbox.checkifSolved(Session["Thread"].ToString());
        if (solved)
        {
            tb_Reply.Visible = false;
            btn_Solved.Visible = false;
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
        Inbox.insertUserMessage(Convert.ToInt32(Session["Thread"]), tb_Reply.Text, Convert.ToInt32(Session["UserId"]), Convert.ToDateTime(datetime));
        Response.Redirect("~/UserPages/Messages.aspx");
    }

    protected void btn_Solved_Click(object sender, EventArgs e)
    {
        Inbox.setSolved(Session["Thread"].ToString());
        Response.Redirect("~/UserPages/MyTickets.aspx");
    }


}