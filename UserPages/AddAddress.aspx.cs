using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AddAddress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserPages/AddressBook.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        {
            try
            {
                if (Page.IsValid)
                {
                    SqlCommand cmd = new SqlCommand("insert into UserAddress(ReferenceName, FName, LName, AddressLine1, AddressLine2, Postcode, ContactNo, UserId) Values(@ReferenceName, @FName, @LName, @AddressLine1, @AddressLine2, @Postcode, @ContactNo, @UserId)", con);
                    cmd.Parameters.AddWithValue("@ReferenceName", tb_RefName.Text);
                    cmd.Parameters.AddWithValue("@FName", tb_FName.Text);
                    cmd.Parameters.AddWithValue("@LName", tb_LName.Text);
                    cmd.Parameters.AddWithValue("@AddressLine1", tb_Address1.Text);
                    cmd.Parameters.AddWithValue("@AddressLine2", tb_Address2.Text);
                    cmd.Parameters.AddWithValue("@Postcode", tb_Zip.Text);
                    cmd.Parameters.AddWithValue("@ContactNo", tb_Phone.Text);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    control.ForeColor = System.Drawing.Color.Blue;
                    control.Text = ("Successfully Saved !");
                    

                    tb_FName.Enabled = false;
                    tb_LName.Enabled = false;
                    tb_RefName.Enabled = false;
                    tb_Address1.Enabled = false;
                    tb_Address2.Enabled = false;
                    tb_Zip.Enabled = false;
                    tb_Phone.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                control.ForeColor = System.Drawing.Color.Red;
                control.Text = ("An Unknown Error Occured, Please Try Again Later.");
            }
        }
    }

}