using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ExpertId"] != null)
        {
            experttoolbar.Visible = true;
            int unread = Inbox.getExpertUnreadCount(Session["ExpertId"].ToString());
            lbl_Messages.Text = Inbox.getExpertUnreadCount(Session["ExpertId"].ToString()).ToString() + " Unread";
            if (unread > 0)
            {
                msg_notification.Visible = true;
            }
        }
        else
        {
            Response.Redirect("~/GuestPages/ExpertLogin.aspx");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/GuestPages/IdentityPage.aspx");
    }
}
