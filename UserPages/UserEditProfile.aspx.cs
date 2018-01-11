using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserEditProfile : System.Web.UI.Page
{
    User user = new User();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string email = Session["Email"].ToString();
            Address_Load(email);

        }
    }

    protected void Address_Load(string email)
    {
        string _connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        DataTable dt = new DataTable();
        string queryStr = "SELECT * FROM [User] WHERE Email = @Email ";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string[] arr = { queryStr };
        string allQueries = string.Join(";", arr);
        cmd.CommandText = allQueries;
        cmd.Connection = conn;
        cmd.Parameters.AddWithValue("@Email", email);
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

        sqlDa.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            string imagePath = String.Format("~/Upload/UserPhoto/{0}.jpg", dt.Rows[0]["Id"]);
            if (File.Exists(Server.MapPath(imagePath)))
            {
                imgPhoto.ImageUrl = imagePath;
            }
            lblId.Text = dt.Rows[0]["Id"].ToString();
            tbUserName.Text = dt.Rows[0]["UserName"].ToString();
            tbFirstName.Text = dt.Rows[0]["FirstName"].ToString();
            tbLastName.Text = dt.Rows[0]["LastName"].ToString();
            lblUserEmail.Text = dt.Rows[0]["Email"].ToString();
            tbPhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
            rblUserGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
        }
        conn.Close();
        conn.Dispose();


    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string _connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd1 = new SqlCommand("UPDATE [User] SET UserName = @UserName, FirstName = @FirstName, LastName = @LastName, Email= @Email, PhoneNumber = @PhoneNumber, Gender = @Gender where Email = '" + Session["Email"] + "'", conn);
            conn.Open();

            cmd1.Parameters.AddWithValue("@UserName", tbUserName.Text);
            cmd1.Parameters.AddWithValue("@FirstName", tbFirstName.Text);
            cmd1.Parameters.AddWithValue("@LastName", tbLastName.Text);
            cmd1.Parameters.AddWithValue("@Email", lblUserEmail.Text);
            cmd1.Parameters.AddWithValue("@PhoneNumber", tbPhoneNumber.Text);
            cmd1.Parameters.AddWithValue("@Gender", rblUserGender.SelectedValue);


            cmd1.ExecuteNonQuery();
            conn.Close();
            if (IsPostBack)
            {

                lbl_Result.Text = "Updated Successfully!";
                tbUserName.Enabled = false;
                tbFirstName.Enabled = false;
                tbLastName.Enabled = false;
                tbPhoneNumber.Enabled = false;
                rblUserGender.Enabled = false;

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
                fuPhoto.SaveAs(Server.MapPath(String.Format("~/Upload/UserPhoto/{0}.jpg", lblId.Text)));
                string imagePath = String.Format("~/Upload/UserPhoto/{0}.jpg", lblId.Text);
                if (File.Exists(Server.MapPath(imagePath)))
                {
                    imgPhoto.ImageUrl = imagePath;
                }
            }
            else
            {
                lbl_Result.Text += "<br />Photo exceed 1MB, upload failed.";
            }
        }
        else
        {
            lbl_Result.Text += "<br />Photo format is not .jpg, upload failed.";
        }
    }


    protected void btnProfileView_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserPages/UserProfile.aspx");
    }
}
