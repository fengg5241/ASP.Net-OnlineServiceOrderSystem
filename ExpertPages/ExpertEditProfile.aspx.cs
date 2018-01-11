using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ExpertProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string email = Session["ExpertId"].ToString();
            Address_Load(email);
        }
    }

    protected void Address_Load(string expertId)
    {
        string _connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        DataTable dt = new DataTable();
        string queryStr = "SELECT * FROM Expert WHERE Id = @ExpertId ";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { queryStr };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = conn;
        cmd.Parameters.AddWithValue("@ExpertId", expertId);
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

        sqlDa.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", dt.Rows[0]["Id"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }
            lblId.Text = dt.Rows[0]["Id"].ToString();
            tbExpUserName.Text = dt.Rows[0]["UserName"].ToString();
            tbExpFirstName.Text = dt.Rows[0]["FirstName"].ToString();
            tbExpLastName.Text = dt.Rows[0]["LastName"].ToString();
            lblExpEmail.Text = dt.Rows[0]["Email"].ToString();
            tbExpPhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
            tbExpAddress.Text = dt.Rows[0]["Address"].ToString();
            rblExpGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
        }
        conn.Close();
        conn.Dispose();


    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string _connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd1 = new SqlCommand("UPDATE Expert SET UserName = @UserName, FirstName = @FirstName, LastName = @LastName, Email= @Email, PhoneNumber = @PhoneNumber, Address = @Address, Gender = @Gender where Email = '" + Session["Email"] + "'", conn);
            conn.Open();

            cmd1.Parameters.AddWithValue("@UserName", tbExpUserName.Text);
            cmd1.Parameters.AddWithValue("@FirstName", tbExpFirstName.Text);
            cmd1.Parameters.AddWithValue("@LastName", tbExpLastName.Text);
            cmd1.Parameters.AddWithValue("@Email", lblExpEmail.Text);
            cmd1.Parameters.AddWithValue("@PhoneNumber", tbExpPhoneNumber.Text);
            cmd1.Parameters.AddWithValue("@Address", tbExpAddress.Text);
            cmd1.Parameters.AddWithValue("@Gender", rblExpGender.SelectedValue);


            cmd1.ExecuteNonQuery();
            conn.Close();

            if (IsPostBack)
            {
                lblMessage.Text = "Updated Successfully!";
                tbExpUserName.Enabled = false;
                tbExpFirstName.Enabled = false;
                tbExpLastName.Enabled = false;
                tbExpPhoneNumber.Enabled = false;
                tbExpAddress.Enabled = false;
                rblExpGender.Enabled = false;
                fuPhoto.Enabled = false;

            }
        }
        catch
        {
            Response.Write("<script>alert('Update NOT Successful');</script>");
        }

        if (fuPhoto.FileName.EndsWith(".jpg") || fuPhoto.FileName.EndsWith(".jpeg"))
        {
            if (fuPhoto.FileBytes.Length < 1024 * 1024)
            {
                fuPhoto.SaveAs(Server.MapPath(String.Format("~/Upload/ExpertPhoto/{0}.jpg", lblId.Text)));
                string imagePath = String.Format("~/Upload/ExpertPhoto/{0}.jpg", lblId.Text);
                if (File.Exists(Server.MapPath(imagePath)))
                {
                    imgPhoto.ImageUrl = imagePath;
                }
            }
            else
            {
                lblMessage.Text += "<br />Photo exceed 1MB, upload failed.";
            }
        }
        else
        {
            lblMessage.Text += "<br />Photo format is not .jpg, upload failed.";
        }



    }

    protected void btnProfileView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ExpertPages/ExpertProfile.aspx");
    }
}


