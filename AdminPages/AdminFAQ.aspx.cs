using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class AdminFAQ : System.Web.UI.Page
{
    

    FAQ aFAQ = new FAQ();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }

    protected void bind()
    {
        List<FAQ> FAQList = new List<FAQ>();

        if (ddl_Filter.SelectedIndex == 0)
        {
            FAQList = aFAQ.getFAQAll();
        }

        else if (ddl_Filter.SelectedIndex == 1)
        {
            FAQList = aFAQ.getFAQAnswered();
        }
        else if (ddl_Filter.SelectedIndex == 2)
        {
            FAQList = aFAQ.getFAQUnanswered();
        }
        gvAdminFAQ.DataSource = FAQList;
        gvAdminFAQ.DataBind();

    }

    protected void gvAdminFAQ_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        FAQ aFAQ = new FAQ();
        string categoryID = gvAdminFAQ.DataKeys[e.RowIndex].Value.ToString();
        result = aFAQ.FAQDelete(categoryID);

        if (result > 0)
        {
            Response.Write("<script>alert('Question removed successfully');</script>");
            Response.Redirect("~/AdminPages/AdminFAQ.aspx");
        }
        else {
            Response.Write("<script>alert('Error. Please contact admin');</script>");
        }

    }

    protected void gvAdminFAQ_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAdminFAQ.EditIndex = e.NewEditIndex;
        bind();
        ddl_Filter.Enabled = false;

    }



    protected void gvAdminFAQ_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int result = 0;
        FAQ aFAQ = new FAQ();
        GridViewRow row = (GridViewRow)gvAdminFAQ.Rows[e.RowIndex];
        string id = gvAdminFAQ.DataKeys[e.RowIndex].Value.ToString();
        string fid = ((TextBox)row.Cells[0].Controls[0]).Text;
        string fanswer = ((TextBox)row.Cells[3].Controls[0]).Text;

        result = aFAQ.FAQUpdate(fid, fanswer);
        if (result > 0)
        {
            Response.Write("<script>alert('Answer updated successfully');</script>");
            Response.Redirect("~/AdminPages/AdminFAQ.aspx");
        }
        else
        {
            Response.Write("<script>alert('Answer not updated');</script>");
        }
        gvAdminFAQ.EditIndex = -1;
        bind();
    }

    protected void gvAdminFAQ_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAdminFAQ.EditIndex = -1;
        bind();
        ddl_Filter.Enabled = true;
    }



    protected void ddl_Filter_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<FAQ> FAQList = new List<FAQ>();

        if (ddl_Filter.SelectedIndex == 0)
        {
            FAQList = aFAQ.getFAQAll();
        }

        else if (ddl_Filter.SelectedIndex == 1)
        {
            FAQList = aFAQ.getFAQAnswered();
        }
        else if (ddl_Filter.SelectedIndex == 2)
        {
            FAQList = aFAQ.getFAQUnanswered();
        }
        gvAdminFAQ.DataSource = FAQList;
        gvAdminFAQ.DataBind();

    }

    
}