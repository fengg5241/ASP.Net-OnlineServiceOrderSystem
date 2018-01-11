using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpertChooseServiceType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {

        int result = 0;
        //Insert into database
        string serviceType = null;
      
        Session["Service"] = serviceType;

        Models.ExpertServiceType service = new Models.ExpertServiceType(cblServices.SelectedItem.Text, tbServiceDesc.Text);
        result = service.ServiceInsert();

        Response.Redirect("~/GuestPages/ExpertVerificationPage.aspx");

    }
}