using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertTickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "SELECT * FROM [SupportTicket] WHERE ExpertId = @UserId ORDER BY Status";
        gv_Tickets.DataSource = Inbox.GetThreads(query, Convert.ToInt32(Session["ExpertId"]));
        gv_Tickets.DataBind();
        gv_Unread.DataSource = Inbox.GetUnread(Convert.ToInt32(Session["ExpertId"]));
        gv_Unread.DataBind();
        int val1 = Convert.ToInt32(gv_Unread.Rows.Count.ToString());
        if (val1 > 0)
        {
            unread.Visible = true;
        }
    }

    protected void gv_Tickets_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Thread"] = gv_Tickets.SelectedRow.Cells[0].Text;
        Inbox.ExpertRead(gv_Tickets.SelectedRow.Cells[0].Text);
        Response.Redirect("~/ExpertPages/ExpertMessages.aspx");
    }

    protected void gv_Unread_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Thread"] = gv_Unread.SelectedRow.Cells[0].Text;
        Inbox.ExpertRead(gv_Unread.SelectedRow.Cells[0].Text);
        Response.Redirect("~/ExpertPages/ExpertMessages.aspx");
    }
}