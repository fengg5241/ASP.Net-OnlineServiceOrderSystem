using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        int result = 0;
        Models.MyLocation location = new Models.MyLocation(ddlRegion.SelectedItem.Text, ddlCity.SelectedItem.Text);
        result = location.MyLocationInsert();
    }
}