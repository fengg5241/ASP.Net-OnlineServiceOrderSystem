using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class PastRewards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gv_Rewards.DataSource = GetCoupons("SELECT * FROM [Coupons] WHERE [UserId] = @UserId ORDER BY [Status], cast([CouponType] as int)");
            gv_Rewards.DataBind();
        }
    }

    public DataTable GetCoupons(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        da.Fill(dtOrd);
        return dtOrd;
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int type = int.Parse(e.Row.Cells[1].Text);
            string status = e.Row.Cells[2].Text;

            foreach (TableCell cell in e.Row.Cells)
            {
                if (type == 20 && status.Equals("unused") )
                {
                    cell.BackColor = Color.LightSkyBlue;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 10 && status.Equals("unused"))
                {
                    cell.BackColor = Color.Silver;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 5 && status.Equals("unused"))
                {
                    cell.BackColor = Color.SandyBrown;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 15 && status.Equals("unused"))
                {
                    cell.BackColor = Color.Gold;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (status.Equals("used"))
                {
                    cell.BackColor = Color.Black;
                    cell.ForeColor = Color.White;
                    e.Row.Cells[2].ForeColor = Color.Red;
                    e.Row.Cells[2].Text = "<b>USED</b>";


                }
            }
        }
    }



}