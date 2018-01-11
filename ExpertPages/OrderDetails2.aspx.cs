using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetails2 : System.Web.UI.Page
{
    ExpOrderDetails ord = null;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderView2.aspx");
    }

    protected void fvOrder_DataBound(object sender, EventArgs e)
    {
        Image imgPhoto = fvOrder.FindControl("imgPhoto") as Image;
        Panel pEdit = fvOrder.FindControl("pEdit") as Panel;
        Panel pNoEdit = fvOrder.FindControl("pNoEdit") as Panel;

        if (fvOrder.DataItem != null)
        {
            DataRow dr = ((DataRowView)fvOrder.DataItem).Row;
            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }

            string status = dr["Status"] as string;
            if (status.ToUpper().Equals("PAID"))
            {
                pEdit.Visible = true;
                pNoEdit.Visible = false;
            }
            else
            {
                pEdit.Visible = false;
                pNoEdit.Visible = true;
            }
        }
    }


    protected void btn_Decline_Click(object sender, EventArgs e)
    {
        ServiceOrderEntities soe = new ServiceOrderEntities();
        int orderId = Convert.ToInt32(Request.QueryString["OrderId"]);
        Order order = soe.Order.Find(orderId);
        order.Status = "REJECTED";
        soe.SaveChanges();
        Response.Redirect("~/ExpertPages/OrderView2.aspx");
    }
}