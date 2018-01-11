using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            getUserPoints(Session["UserId"].ToString());
            usertoolbar.Visible = true;
            int unread = Inbox.getUserUnreadCount(Session["UserId"].ToString());
            lbl_Messages.Text = Inbox.getUserUnreadCount(Session["UserId"].ToString()).ToString() + " Unread";
            if (unread > 0)
            {
                msg_notification.Visible = true;
            }
        }
        if (Session["UserId"] == null)
        {
            nousertoolbar.Visible = false;
        }

    }

    protected void getUserPoints(string user)
    {
        string query = "SELECT (Points) FROM [User] WHERE [Id] = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Id", user);
        cmd.Connection = con;
        cmd.CommandText = query;

        SqlDataReader rdr;
        con.Open();
        cmd.ExecuteNonQuery();
        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            lbl_points.Text = rdr[0].ToString();
            if (Convert.ToInt32(rdr[0]) > 50)
            {
                img_notification.Visible = true;
            }
        }

        rdr.Close();
        con.Close();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/GuestPages/IdentityPage.aspx");
    }
}
