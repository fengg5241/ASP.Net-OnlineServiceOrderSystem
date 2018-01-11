using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class WriteReview : System.Web.UI.Page
{
    string userid = "James";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["OrderId"] != null)
        {
            Bind(Convert.ToInt32(Request.QueryString["OrderId"]));
        }
        else
        {
            Response.Redirect("~/UserPages/OrderView.aspx");
        }

    }
    protected void Bind(int orderId)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            ServiceOrderEntities soe = new ServiceOrderEntities();
            OrderView ov = soe.OrderView.Find(orderId);
            if (ov.UserId == userId)
            {
                lbl_Worker.Text = ov.ExpertFullName;
                btn_Cancel.PostBackUrl = String.Format("~/UserPages/OrderDetail.aspx?Id={0}", orderId);
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }


        }
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            int orderId = Convert.ToInt32(Request.QueryString["OrderId"]);

            ServiceOrderEntities soe = new ServiceOrderEntities();
            Order o = soe.Order.Find(orderId);
            o.Status = "COMPLETED";

            OrderReview or = new OrderReview();
            or.OrderId = orderId;
            or.Reviews = tb_Comments.Text;
            or.Rating = Rating1.CurrentRating;
            or.CreatedDateTime = DateTime.Now;
            o.OrderReview = or;
            soe.SaveChanges();
            Response.Redirect(String.Format("~/UserPages/OrderDetail.aspx?Id={0}", orderId));
        }
    }

    protected void cvSubmit_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = true;

        if (Rating1.CurrentRating == 0)
        {
            string message = "Please select a rating.\r\n";
            cvSubmit.ErrorMessage += message;
            args.IsValid = false;

        }
        else if (String.IsNullOrWhiteSpace(tb_Comments.Text))
        {
            string message = "Please write a comment.\r\n";
            cvSubmit.ErrorMessage += message;
            args.IsValid = false;
        }
    }
}