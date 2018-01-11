using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPages_ServiceDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            calTimeslot.SelectedDate = DateTime.Now.Date;
        }
    }


    protected void fvService_DataBound(object sender, EventArgs e)
    {
        Image imgPhoto = fvService.FindControl("imgPhoto") as Image;
        if (fvService.DataItem != null)
        {
            DataRow dr = ((DataRowView)fvService.DataItem).Row;
            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            int serviceId = Convert.ToInt32(Request.QueryString["Id"]);
            Label lblPrice = fvService.FindControl("lblPrice") as Label;
            Label lblSurcharge = fvService.FindControl("lblSurcharge") as Label;
            Label lblUrgentDays = fvService.FindControl("lblUrgentDays") as Label;
            decimal surcharge = Convert.ToDecimal(lblSurcharge.Text);
            int urgentDays = Convert.ToInt32(lblUrgentDays.Text);
            DateTime serviceDate = calTimeslot.SelectedDate;
            decimal unitPrice = Convert.ToDecimal(lblPrice.Text);

            if ((serviceDate - DateTime.Now).Days < urgentDays)
            {
                unitPrice = unitPrice + surcharge;
            }

            List<DateTime> selectedTimeslots = new List<DateTime>();
            foreach (ListViewDataItem item in lvTimeslot.Items)
            {
                CheckBox chkTimeslot = item.FindControl("chkTimeslot") as CheckBox;
                if (chkTimeslot.Checked)
                {
                    string strTime = chkTimeslot.Text;
                    DateTime timeslot = serviceDate.Date + TimeSpan.FromHours(Convert.ToInt32(strTime.Split(':')[0]));
                    selectedTimeslots.Add(timeslot);
                }
            }

            ServiceOrderEntities soe = new ServiceOrderEntities();

            Order order = new Order();

            order.UserId = userId;
            order.ServiceId = serviceId;
            order.Price = unitPrice * selectedTimeslots.Count;
            order.Address = "Please Enter Address.";
            order.ServiceDate = serviceDate;
            foreach (DateTime timeslot in selectedTimeslots)
            {
                OrderTimeslot ots = new OrderTimeslot();
                ots.Order = order;
                ots.ServiceId = serviceId;
                ots.Timeslot = timeslot;
                order.OrderTimeslot.Add(ots);
            }
            order.Status = "PENDING";
            order.Enabled = true;
            order.CreatedDateTime = DateTime.Now;
            soe.Order.Add(order);
            soe.SaveChanges();

            Response.Redirect(String.Format("~/UserPages/OrderForm.aspx?Id={0}", order.Id));
        }
    }

    protected void gvReview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow gvr = e.Row as GridViewRow;
        if (gvr.RowType == DataControlRowType.DataRow)
        {
            DataRow dr = ((DataRowView)gvr.DataItem).Row as DataRow;

            Image imgPhoto = gvr.FindControl("imgPhoto") as Image;

            int userId = Convert.ToInt32(dr["UserId"]);

            string imagePath = String.Format("~/Upload/UserPhoto/{0}.png", userId);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }


            Label lblRating = gvr.FindControl("lblRating") as Label;
            int rating = Convert.ToInt32(dr["Rating"]);

            string ratingStars = "";
            for (int i = 0; i < rating; i++)
            {
                ratingStars += "⭐";
            }
            lblRating.Text = ratingStars;
        }
    }

    protected void cvSubmit_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool isAnyTimeslotSelected = false;
        bool isPreviousTimeslotSelected = false;
        foreach (ListViewDataItem item in lvTimeslot.Items)
        {
            CheckBox chkTimeslot = item.FindControl("chkTimeslot") as CheckBox;
            if (chkTimeslot.Checked)
            {
                if (isAnyTimeslotSelected)
                {
                    if (isPreviousTimeslotSelected)
                    {
                        isAnyTimeslotSelected = true;
                    }
                    else
                    {
                        args.IsValid = false;
                        cvSubmit.ErrorMessage = "Please select continually timeslots.";
                        return;
                    }
                }
                else
                {
                    isAnyTimeslotSelected = true;
                }
            }
            isPreviousTimeslotSelected = chkTimeslot.Checked;
        }

        if (!isAnyTimeslotSelected)
        {
            args.IsValid = false;
            cvSubmit.ErrorMessage = "Please select timeslots.";
        }
    }
}