using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ExpertPages_ServiceAddEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string serviceId = Request.QueryString["Id"];
            if ((serviceId == null) || (serviceId.Length == 0) || (serviceId.Equals("0")))
            {
                dvService.ChangeMode(DetailsViewMode.Insert);
                tbTimeSlot.Visible = false;
            }
        }
    }

    protected void dvService_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        DetailsView dv = sender as DetailsView;
        DropDownList ddlServiceType = dv.FindControl("ddlServiceType") as DropDownList;
        e.NewValues["Type"] = ddlServiceType.SelectedValue;
        e.NewValues["ExpertId"] = Session["ExpertId"];
    }

    protected void dvService_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        DetailsView dv = sender as DetailsView;
        DropDownList ddlServiceType = dv.FindControl("ddlServiceType") as DropDownList;
        e.Values["Type"] = ddlServiceType.SelectedValue;
        e.Values["ExpertId"] = Session["ExpertId"];
    }

    protected void dvService_DataBound(object sender, EventArgs e)
    {
        DetailsView dv = sender as DetailsView;
        if (dv.DataItem != null)
        {
            DataRow dr = ((DataRowView)dv.DataItem).Row;
            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }

            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                DropDownList ddlServiceType = dv.FindControl("ddlServiceType") as DropDownList;
                Label lblServiceType = dv.FindControl("lblServiceType") as Label;
                ddlServiceType.SelectedValue = lblServiceType.Text;

                // Check if this service belong to current logon expert, if no, deny edit mode.
                int serviceExpertId = Convert.ToInt32(dr["ExpertId"]);
                int currentExpertId = Convert.ToInt32(Session["ExpertId"]);
                if (serviceExpertId != currentExpertId)
                {
                    dv.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
        }
    }

    int lastWeekDay = -1;
    protected string GetWeekDayHeader(int weekday)
    {
        string result = "";
        if (weekday != lastWeekDay)
        {
            result = String.Format("<td rowspan=\"2\"><h5>{0}</h5></td>", WeekDays[weekday]);
            lastWeekDay = weekday;
        }
        return result;
    }

    string[] WeekDays = { "", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Save each timeslot
        for (int i = 0; i < lvTimeslot.Items.Count; i++)
        {
            lvTimeslot.UpdateItem(i, false);
        }
    }

    protected void lvTimeslot_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
    {
        // This function is just for add break to check if timeslot is saved properly
    }

    protected void dvService_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("~/ExpertPages/ServiceView.aspx");
    }
}