using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

public partial class AddressBook : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_Add.Attributes.Add("onmouseover", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddAddress2.jpg") + "'");
        btn_Add.Attributes.Add("onmouseout", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddAddress.jpg") + "'");
        if (!IsPostBack)
        {
            lv_Address.DataSource = GetAddress("Select * from UserAddress WHERE [Id] > 0 AND [UserId] = @UserId");
            lv_Address.DataBind();
        }

    }

    public DataTable GetAddress(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtAdd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        da.Fill(dtAdd);
        return dtAdd;
    }


    protected void btn_Add_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/UserPages/AddAddress.aspx");
    }

    protected void lv_Address_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        string Id = "", RefName = "", FName = "", LName = "", Address1 = "", Address2 = "", ZipCode = "", ContactNo = "", CardType = "";
        Label lbl = (lv_Address.Items[e.ItemIndex].FindControl("lbl_Id")) as Label;
        if (lbl != null)
            Id = lbl.Text;
        lbl = (lv_Address.Items[e.ItemIndex].FindControl("lbl_Type")) as Label;
        if (lbl != null)
            CardType=lbl.Text;
        TextBox txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_RefName")) as TextBox;
        if (txt != null)
            RefName = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_FName")) as TextBox;
        if (txt != null)
            FName = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_LName")) as TextBox;
        if (txt != null)
            LName = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_Address1")) as TextBox;
        if (txt != null)
            Address1 = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_Address2")) as TextBox;
        if (txt != null)
            Address2 = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_Zip")) as TextBox;
        if (txt != null)
            ZipCode = txt.Text;
        txt = (lv_Address.Items[e.ItemIndex].FindControl("tb_Phone")) as TextBox;
        if (txt != null)
            ContactNo = txt.Text;
        string UpdateQuery = "UPDATE [UserAddress] SET [ReferenceName] = '" + RefName + "', [FName] = '" + FName + "', [LName] = '" + LName + "', [AddressLine1] = '" + Address1 + "', [AddressLine2] = '" + Address2 + "' , [PostCode] = '" + ZipCode + "', [ContactNo] = '" + ContactNo + "' WHERE [Id] = '" + Id + "'";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand(UpdateQuery, con);
        com.ExecuteNonQuery();
        con.Close();
        lv_Address.EditIndex = -1;
        lv_Address.DataSource = GetAddress("Select * from UserAddress WHERE Id > 0 AND [UserId] = @UserId ");
        lv_Address.DataBind();
    }

    protected void lv_Address_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string Addressid = "";
        Label lbl = (lv_Address.Items[e.ItemIndex].FindControl("lbl_Id")) as Label;
        if (lbl != null)
            Addressid = lbl.Text;
        string DeleteQuery = "Delete from UserAddress WHERE [Id] = '" + Addressid + "'";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand(DeleteQuery, con);
        com.ExecuteNonQuery();
        con.Close();
        lv_Address.EditIndex = -1;
        lv_Address.DataSource = GetAddress("Select * from UserAddress WHERE Id > 0  AND [UserId] = @UserId");
        lv_Address.DataBind();
    }

    protected void lv_Address_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        lv_Address.EditIndex = e.NewEditIndex;
        lv_Address.DataSource = GetAddress("Select * from UserAddress WHERE Id > 0  AND [UserId] = @UserId");
        lv_Address.DataBind();
    }

    protected void lv_Address_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        lv_Address.EditIndex = -1;
        lv_Address.DataSource = GetAddress("Select * from UserAddress WHERE Id > 0  AND [UserId] = @UserId");
        lv_Address.DataBind();
    }

}