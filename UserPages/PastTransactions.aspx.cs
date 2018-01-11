using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PastTransactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gv_Transactions.DataSource = GetOrders("SELECT * FROM [Order] o INNER JOIN [Service] s ON o.ServiceId = s.Id INNER JOIN [Expert] e ON e.Id = s.ExpertId WHERE [UserId] = @UserId AND [Status] = @Status");
            gv_Transactions.DataBind();
        }
    }

    public DataTable GetOrders(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@Status", "PAID");
        da.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        da.Fill(dtOrd);
        return dtOrd;
    }

    protected void gv_Transactions_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["OrderId"] = gv_Transactions.SelectedRow.Cells[0].Text;
        
        Response.Redirect("~/UserPages/Receipt.aspx");
    }
}