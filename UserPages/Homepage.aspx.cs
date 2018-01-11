using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.IO;

public partial class Home : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_Search_Click(object sender, EventArgs e)
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