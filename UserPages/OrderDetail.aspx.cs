using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPages_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkOrderCancel_Click(object sender, EventArgs e)
    {
        int orderId = Convert.ToInt32(Request.QueryString["Id"]);
        ServiceOrderEntities soe = new ServiceOrderEntities();

        Order order = soe.Order.Find(orderId);
        order.Status = "CANCELLED";
        soe.SaveChanges();
    }

    protected void fvOrder_DataBound(object sender, EventArgs e)
    {
        Image imgPhoto = fvOrder.FindControl("imgPhoto") as Image;
        Panel pEdit = fvOrder.FindControl("pEdit") as Panel;
        Panel pNoEdit = fvOrder.FindControl("pNoEdit") as Panel;
        Panel pReview = fvOrder.FindControl("pReview") as Panel;

        if (fvOrder.DataItem != null)
        {
            DataRow dr = ((DataRowView)fvOrder.DataItem).Row;
            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }

            string status = dr["Status"] as string;
            switch (status)
            {
                case "PAID":
                    pEdit.Visible = false;
                    pReview.Visible = true;
                    pNoEdit.Visible = false;
                    break;
                case "PENDING":
                    pEdit.Visible = true;
                    pReview.Visible = false;
                    pNoEdit.Visible = false;
                    break;
                case "CANCELLED":
                    break;
                case "REJECTED":
                    break;
                default:
                    break;
            }
        }
    }
}