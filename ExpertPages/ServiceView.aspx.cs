using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertPages_ServiceView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lvService_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Image imgPhoto = e.Item.FindControl("imgPhoto") as Image;

        DataRow dr = ((DataRowView)e.Item.DataItem).Row;
        string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dr["ExpertId"]);
        if (File.Exists(Server.MapPath(imagePath)))
        {
            imgPhoto.ImageUrl = imagePath;
        }
    }
}