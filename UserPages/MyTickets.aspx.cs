using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyTickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_NewTicket.Attributes.Add("onmouseover", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddTicket2.jpg") + "'");
            btn_NewTicket.Attributes.Add("onmouseout", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddTicket.jpg") + "'");
            string query = "SELECT * FROM [SupportTicket] LEFT JOIN [Expert] ON [Expert].Id = [SupportTicket].ExpertId WHERE UserId = @UserId ORDER BY Status";
            gv_Tickets.DataSource = Inbox.GetThreads(query, Convert.ToInt32(Session["UserId"]));
            gv_Tickets.DataBind();
            gv_Unread.DataSource = Inbox.GetUserUnread(Convert.ToInt32(Session["UserId"]));
            gv_Unread.DataBind();
            int val1 = Convert.ToInt32(gv_Unread.Rows.Count.ToString());
            if (val1 > 0)
            {
                unread.Visible = true;
            }
        }
    }

    protected void gv_Tickets_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Thread"] = gv_Tickets.SelectedRow.Cells[0].Text;
        string thread = gv_Tickets.SelectedRow.Cells[0].Text;
        Inbox.userRead(thread);
        Response.Redirect("~/UserPages/Messages.aspx");
    }

    protected void btn_NewTicket_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/UserPages/CreateTicket.aspx");
    }

    protected void gv_Unread_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Thread"] = gv_Unread.SelectedRow.Cells[0].Text;
        Inbox.userRead(gv_Unread.SelectedRow.Cells[0].Text);
        Response.Redirect("~/UserPages/Messages.aspx");
    }
}