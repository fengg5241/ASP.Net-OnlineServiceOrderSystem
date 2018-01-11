using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
        PopulateDropDown();
        }
    }

    protected void PopulateDropDown()
    {
        ddl_SelectOrder.Items.Insert(0, new ListItem("--Select an Order ID--", "0"));
        ddl_SelectOrder.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        using (con)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Id, Id AS OrderChoice FROM [Order] WHERE UserId = @UserId AND Status = @Status"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Status", "PAID");
                cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                con.Open();
                ddl_SelectOrder.DataSource = cmd.ExecuteReader();
                ddl_SelectOrder.DataTextField = "OrderChoice";
                ddl_SelectOrder.DataValueField = "Id";
                ddl_SelectOrder.DataBind();
                con.Close();
                con.Dispose();
            }
        }
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        var duplicate = Inbox.checkDuplicate(ddl_SelectOrder.SelectedValue);
        if (duplicate)
        {
            Inbox.insertThread(tb_Title.Text, Convert.ToInt32(Session["UserId"]), ddl_SelectOrder.SelectedValue);
            Response.Redirect("~/UserPages/MyTickets.aspx");
        }
        else
        {
            control.Text = "You have already created a Thread for this Order ID";
        }
        
    }
}