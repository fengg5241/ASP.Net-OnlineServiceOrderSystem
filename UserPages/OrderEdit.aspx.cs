using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPages_OrderEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            calTimeslot.SelectedDate = DateTime.Now.Date;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int orderId = Convert.ToInt32(Request.QueryString["Id"]);
            DateTime serviceDate = calTimeslot.SelectedDate;

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

            Order order = soe.Order.Find(orderId);

            order.ServiceDate = serviceDate;
            order.OrderTimeslot.Clear();
            foreach (DateTime timeslot in selectedTimeslots)
            {
                OrderTimeslot ots = new OrderTimeslot();
                ots.Order = order;
                ots.ServiceId = order.ServiceId.Value;
                ots.Timeslot = timeslot;
                order.OrderTimeslot.Add(ots);
            }

            order.CreatedDateTime = DateTime.Now;
            soe.SaveChanges();

            Response.Redirect(String.Format("~/UserPages/OrderPayment.aspx?Id={0}", order.Id));
        }
    }

    protected void cvSubmit_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Label lblTimeslotCount = fvOrder.FindControl("lblTimeslotCount") as Label;
        int timeslotCount = Convert.ToInt32(lblTimeslotCount.Text);

        int currentCount = 0;
        bool isAnyTimeslotSelected = false;
        bool isPreviousTimeslotSelected = false;
        foreach (ListViewDataItem item in lvTimeslot.Items)
        {
            CheckBox chkTimeslot = item.FindControl("chkTimeslot") as CheckBox;
            if (chkTimeslot.Checked)
            {
                currentCount++;
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

        if (currentCount != timeslotCount)
        {
            args.IsValid = false;
            cvSubmit.ErrorMessage = String.Format("Please select <b>{0}</b> timeslots.", timeslotCount);
        }
    }

    protected void fvOrder_DataBound(object sender, EventArgs e)
    {
        Image imgPhoto = fvOrder.FindControl("imgPhoto") as Image;
        Panel pEdit = fvOrder.FindControl("pEdit") as Panel;
        Panel pNoEdit = fvOrder.FindControl("pNoEdit") as Panel;
        Label lblStatus = fvOrder.FindControl("lblStatus") as Label;

        if (fvOrder.DataItem != null)
        {
            DataRow dr = ((DataRowView)fvOrder.DataItem).Row;

            lblServiceId.Text = dr["ServiceId"].ToString();

            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }

             if (lblStatus.Text.Equals("PENDING"))
            {
            }
            else
            {
                Response.Redirect(String.Format("~/UserPages/OrderDetail.aspx?Id={0}", dr["Id"].ToString()));
            }

        }
    }
}