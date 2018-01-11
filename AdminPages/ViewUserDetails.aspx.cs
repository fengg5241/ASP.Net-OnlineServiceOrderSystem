using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUserDetails : System.Web.UI.Page
{
    Models.User aUser = new Models.User();
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
        List<Models.User> userList = new List<Models.User>();
        userList = aUser.getUserAll();
        gvUser.DataSource = userList;
        gvUser.DataBind();
    }




    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        Models.User user = new Models.User();
        string UserId = gvUser.DataKeys[e.RowIndex].Value.ToString();
        result = user.UserDelete(UserId);



        Response.Redirect("~/AdminPages/ViewUserDetails.aspx");
    }

    protected void gvUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the currently selected row.
        GridViewRow row = gvUser.SelectedRow;
        // Get Product ID from the selected row, which is the
        // first row, i.e. index 0.
        string userID = row.Cells[0].Text;
        // Redirect to next page, with the Product Id added to the URL,
        // e.g. ProductDetails.aspx?ProdID=1
        Response.Redirect("~/AdminPages/UserDetails.aspx?ID=" + userID);
    }



    protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUser.EditIndex = e.NewEditIndex;
        bind();
    }

    protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUser.EditIndex = -1;
        bind();
    }

    protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int result = 0;
        Models.User user = new Models.User();
        GridViewRow row = (GridViewRow)gvUser.Rows[e.RowIndex];
        string id = gvUser.DataKeys[e.RowIndex].Value.ToString();
        int tId = int.Parse(((TextBox)row.Cells[0].Controls[0]).Text);
        string tUserName = ((TextBox)row.Cells[1].Controls[0]).Text;
        string tFName = ((TextBox)row.Cells[2].Controls[0]).Text;
        string tLName = ((TextBox)row.Cells[3].Controls[0]).Text;
        string tEmail = ((TextBox)row.Cells[4].Controls[0]).Text;
        string tPassword = ((TextBox)row.Cells[5].Controls[0]).Text;
        string tPhoneNo = ((TextBox)row.Cells[6].Controls[0]).Text;
        string tGender = ((TextBox)row.Cells[7].Controls[0]).Text;

        result = user.UserUpdate(tId, tUserName, tFName, tLName, tEmail, tPassword, tPhoneNo, tGender);
        if (result > 0)
        {
            Response.Write("<script>alert('Updated successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('NOT successfully updated');</script>");
        }
        gvUser.EditIndex = -1;
        bind();
    }

  
}