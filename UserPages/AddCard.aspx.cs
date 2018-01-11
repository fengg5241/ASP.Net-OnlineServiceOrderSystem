using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // Image Change from DropDown
    protected void list_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (list_Type.SelectedIndex == 0)
        {
            img_Type.ImageUrl = "";
        }
        if (list_Type.SelectedIndex == 1)
        {
            img_Type.ImageUrl = "~/Images/amexLogo.png";
        }
        if (list_Type.SelectedIndex == 2)
        {
            img_Type.ImageUrl = "~/Images/mastercardLogo.png";
        }
        else if (list_Type.SelectedIndex == 3)
        {
            img_Type.ImageUrl = "~/Images/visaLogo.png";
        }
    }
    // Validation
    protected void Validation(object source, ServerValidateEventArgs args)
    {

        bool hasType = list_Type.SelectedIndex > 0 ? true : false;
        bool hasFirstNo = tb_CCNo1.Text.Length > 0 ? true : false;
        bool hasSecondNo = tb_CCNo2.Text.Length > 0 ? true : false;
        bool hasThirdNo = tb_CCNo3.Text.Length > 0 ? true : false;
        bool hasFourthNo = tb_CCNo4.Text.Length > 0 ? true : false;
        bool hasName = tb_Name.Text.Length > 0 ? true : false;
        bool hasMonth = list_Month.SelectedIndex > 0 ? true : false;
        bool hasYear = tb_Year.Text.Length > 0 ? true : false;

        if (hasFirstNo && hasSecondNo && hasThirdNo && hasFourthNo && hasName && hasType && hasMonth && hasYear)
        {
            args.IsValid = true;
        }
        else
            args.IsValid = false;
    }


    protected void btn_Save_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        try
        {
            if (Page.IsValid)
            {
                var ccnumber = tb_CCNo1.Text + tb_CCNo2.Text + tb_CCNo3.Text + tb_CCNo4.Text;
                var expiryDate = list_Month.SelectedValue +"/" +tb_Year.Text;
                string type = list_Type.SelectedValue;
                string month = list_Month.SelectedValue;
                var results = CardChecker.checkCard(ccnumber);
                var validity = CardChecker.isValid(expiryDate);
                if (results && validity)
                {
                    SqlCommand cmd = new SqlCommand("insert into UserPayment(CardNo, CardType, Name, ExpiryMonth, ExpiryYear, UserId) Values(@CardNo, @CardType, @Name, @ExpiryMonth, @ExpiryYear,@UserId)", con);
                    cmd.Parameters.AddWithValue("@CardNo", tb_CCNo1.Text + tb_CCNo2.Text + tb_CCNo3.Text + tb_CCNo4.Text);
                    cmd.Parameters.AddWithValue("@CardType", type);
                    cmd.Parameters.AddWithValue("@Name", tb_Name.Text);
                    cmd.Parameters.AddWithValue("@ExpiryMonth", month);
                    cmd.Parameters.AddWithValue("@ExpiryYear", tb_Year.Text);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    control.ForeColor = System.Drawing.Color.Blue;
                    control.Text = ("Card Added Successfully!");

                    list_Type.Enabled = false;
                    list_Month.Enabled = false;
                    tb_Name.Enabled = false;
                    tb_CCNo1.Enabled = false;
                    tb_CCNo2.Enabled = false;
                    tb_CCNo3.Enabled = false;
                    tb_CCNo4.Enabled = false;
                    tb_Year.Enabled = false;
                }
                else if (validity)
                {
                    control.ForeColor = System.Drawing.Color.Red;
                    control.Text = ("Invalid Credit Card Number.");
                }
                else if (results)
                {
                    control.ForeColor = System.Drawing.Color.Red;
                    control.Text = ("Your Card has expired.");
                }
                else
                {
                    control.ForeColor = System.Drawing.Color.Red;
                    control.Text = ("Card number is invalid and/or expired.");
                }
            }
        }
        catch (Exception ex)
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("An Unknown Error Occured, Please Try Again Later.");
        }
    }



    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserPages/PaymentMethods.aspx");
    }
}


    