using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewExpertDetails : System.Web.UI.Page
{
    Models.Expert aExp = new Models.Expert();
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
       
    }

    protected void bind()
    {
        List<Models.Expert> expList = new List<Models.Expert>();
        expList = aExp.getExpertAll();
        gvExpert.DataSource = expList;
        gvExpert.DataBind();
    }



    protected void gvExpert_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        Models.Expert exp = new Models.Expert();
        string ExpId = gvExpert.DataKeys[e.RowIndex].Value.ToString();
        result = exp.ExpertDelete(ExpId);

   

       Response.Redirect("~/AdminPages/ViewExpertDetails.aspx");

       // string categoryID = gvProduct.DataKeys[e.RowIndex].Value.ToString();
       


    }

    protected void gvExpert_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the currently selected row.
        GridViewRow row = gvExpert.SelectedRow;
        // Get Product ID from the selected row, which is the
        // first row, i.e. index 0.
        string expID = row.Cells[0].Text;
        // Redirect to next page, with the Product Id added to the URL,
        // e.g. ProductDetails.aspx?ProdID=1
        Response.Redirect("~/AdminPages/ExpertDetails.aspx?Id=" + expID);
    }



    protected void gvExpert_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvExpert.EditIndex = e.NewEditIndex;
        bind();
    }

    protected void gvExpert_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvExpert.EditIndex = -1;
        bind();
    }

    protected void gvExpert_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int result = 0;
        Models.Expert exp = new Models.Expert();
        GridViewRow row = (GridViewRow)gvExpert.Rows[e.RowIndex];
        string id = gvExpert.DataKeys[e.RowIndex].Value.ToString();
        int tId = int.Parse(((TextBox)row.Cells[0].Controls[0]).Text);
        string tUserName = ((TextBox)row.Cells[1].Controls[0]).Text;
        string tFName = ((TextBox)row.Cells[2].Controls[0]).Text;
        string tLName = ((TextBox)row.Cells[3].Controls[0]).Text;
        string tEmail = ((TextBox)row.Cells[4].Controls[0]).Text;
        string tPassword = ((TextBox)row.Cells[5].Controls[0]).Text;
        string tAddress = ((TextBox)row.Cells[6].Controls[0]).Text;
        string tPhoneNo = ((TextBox)row.Cells[7].Controls[0]).Text;
        string tGender = ((TextBox)row.Cells[8].Controls[0]).Text;
    
        result = exp.ExpertUpdate(tId, tUserName, tFName, tLName, tEmail, tPassword, tAddress, tPhoneNo, tGender);
        if (result > 0)
        {
            Response.Write("<script>alert('Updated successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('NOT successfully updated');</script>");
        }
        gvExpert.EditIndex = -1;
        bind();

    }





    protected void btnManage_Click(object sender, EventArgs e)
    {
        Session["ExpertId"] = gvExpert.SelectedRow.Cells[0].Text;
        Response.Redirect("~/AdminPages/ExpertDetails.aspx");
    }





    protected void IsApproved_CheckedChanged(object sender, EventArgs e)
    {
        
      
    }
}