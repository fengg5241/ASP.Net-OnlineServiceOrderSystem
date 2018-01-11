using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text;
using System.Drawing;

public partial class OrderForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Checkout.Attributes.Add("onmouseover", "this.src= '" + this.Page.ResolveClientUrl("~/Images/Checkout2.jpg") + "'");
            btn_Checkout.Attributes.Add("onmouseout", "this.src= '" + this.Page.ResolveClientUrl("~/Images/Checkout1.jpg") + "'");
            PopulateDropDown();
            PopulateDropDown2();
            Session["CouponUsed"] = "NIL";
            Session["free"] = 0;
            decimal round = Convert.ToDecimal(Session["TotalPrice"]);
            ServiceOrderEntities soe = new ServiceOrderEntities();
            string strOrderId = Request.QueryString["Id"];
            int orderId = Convert.ToInt32(strOrderId);

            OrderView order = soe.OrderView.Find(orderId);

            lbl_Name.Text = order.ExpertFullName;
            lbl_Price.Text = String.Format("{0:N2}", order.Price);
            Session["OriginalPrice"] = order.Price;
            Session["FinalPrice"] = order.Price;
            lbl_Service.Text = order.ServiceName;
            lbl_Duration.Text = String.Format("{0} Hours", order.TimeslotCount);
            Session["Duration"] = order.TimeslotCount;
            lbl_Count.Text = Coupon.seeAvaliable(Session["UserId"].ToString()).ToString();
            if (lbl_Count.Text.Equals("0"))
            {
                btn_ViewCoupons.Visible = false;
            }
        }
    }

    //NEW CARD IMG
    protected void ddl_CardType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_CardType.SelectedIndex == 0)
        {
            img_Type.ImageUrl = "";
        }
        if (ddl_CardType.SelectedIndex == 1)
        {
            img_Type.ImageUrl = "~/Images/amexLogo.png";
        }
        if (ddl_CardType.SelectedIndex == 2)
        {
            img_Type.ImageUrl = "~/Images/mastercardLogo.png";
        }
        if (ddl_CardType.SelectedIndex == 3)
        {
            img_Type.ImageUrl = "~/Images/visaLogo.png";
        }
    }
    //EXISTING CARD IMG
    protected void cardTypeImage(string value)
    {
        if (value.Equals("AMEX"))
        {
            img_Type.ImageUrl = "~/Images/amexLogo.png";
        }
        if (value.Equals("Mastercard"))
        {
            img_Type.ImageUrl = "~/Images/mastercardLogo.png";
        }
        else if (value.Equals("Visa"))
        {
            img_Type.ImageUrl = "~/Images/visaLogo.png";
        }
    }

    //Populate for Address
    protected void PopulateDropDown()
    {
        ddl_SelectAddress.Items.Insert(0, new ListItem("--Select an Address--", "0"));
        ddl_SelectAddress.Items.Insert(1, new ListItem("USE A NEW ADDRESS", "1"));
        ddl_SelectAddress.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        using (con)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Id, ReferenceName + ', ' +FName + ' ' +LName + ', ' + AddressLine1 AS AddressChoice FROM UserAddress WHERE (Id) > 0 AND UserId = @UserId"))
            {
                cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                ddl_SelectAddress.DataSource = cmd.ExecuteReader();
                ddl_SelectAddress.DataTextField = "AddressChoice";
                ddl_SelectAddress.DataValueField = "Id";
                ddl_SelectAddress.DataBind();
                con.Close();
                con.Dispose();
            }
        }
    }

    //Populate for Card
    protected void PopulateDropDown2()
    {
        ddl_SelectCard.Items.Insert(0, new ListItem("--Select a Payment Method--", "0"));
        ddl_SelectCard.Items.Insert(1, new ListItem("USE PAYPAL", "1"));
        ddl_SelectCard.Items.Insert(2, new ListItem("USE A NEW CARD", "2"));
        ddl_SelectCard.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        using (con)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Id, CardType + ', ' +CardNo + ', ' +Name AS CardChoice FROM UserPayment WHERE Id > 1 AND UserId = @UserId"))
            {
                cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                ddl_SelectCard.DataSource = cmd.ExecuteReader();
                ddl_SelectCard.DataTextField = "CardChoice";
                ddl_SelectCard.DataValueField = "Id";
                ddl_SelectCard.DataBind();
                con.Close();
                con.Dispose();
            }
        }
    }
    //DropDown List Select Address
    protected void ddl_SelectAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_SelectAddress.SelectedIndex == 0)
        {
            tb_RefName.Visible = false;
            tb_FName.Visible = false;
            tb_LName.Visible = false;
            tb_Address1.Visible = false;
            tb_Address2.Visible = false;
            tb_Zip.Visible = false;
            tb_Phone.Visible = false;
        }
        if (ddl_SelectAddress.SelectedIndex == 1)
        {
            tb_RefName.Visible = true;
            tb_FName.Visible = true;
            tb_LName.Visible = true;
            tb_Address1.Visible = true;
            tb_Address2.Visible = true;
            tb_Zip.Visible = true;
            tb_Phone.Visible = true;

            tb_RefName.Enabled = true;
            tb_FName.Enabled = true;
            tb_LName.Enabled = true;
            tb_Address1.Enabled = true;
            tb_Address2.Enabled = true;
            tb_Zip.Enabled = true;
            tb_Phone.Enabled = true;

            tb_RefName.Text = "";
            tb_FName.Text = "";
            tb_LName.Text = "";
            tb_Address1.Text = "";
            tb_Address2.Text = "";
            tb_Zip.Text = "";
            tb_Phone.Text = "";
        }
        else
        {
            SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * FROM UserAddress WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", ddl_SelectAddress.SelectedItem.Value);
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    tb_RefName.Visible = true;
                    tb_FName.Visible = true;
                    tb_LName.Visible = true;
                    tb_Address1.Visible = true;
                    tb_Address2.Visible = true;
                    tb_Zip.Visible = true;
                    tb_Phone.Visible = true;

                    tb_RefName.Enabled = false;
                    tb_FName.Enabled = false;
                    tb_LName.Enabled = false;
                    tb_Address1.Enabled = false;
                    tb_Address2.Enabled = false;
                    tb_Zip.Enabled = false;
                    tb_Phone.Enabled = false;

                    tb_RefName.Text = sdr["ReferenceName"].ToString();
                    tb_FName.Text = sdr["FName"].ToString();
                    tb_LName.Text = sdr["LName"].ToString();
                    tb_Address1.Text = sdr["AddressLine1"].ToString();
                    tb_Address2.Text = sdr["AddressLine2"].ToString();
                    tb_Zip.Text = sdr["PostCode"].ToString();
                    tb_Phone.Text = sdr["ContactNo"].ToString();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }

    //DropDown List Select Card
    protected void ddl_SelectCard_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_SelectCard.SelectedIndex == 0)//Please Select
        {
            lbl_CardType.Visible = false;
            ddl_CardType.Visible = false;
            lbl_CardName.Visible = false;
            tb_CName.Visible = false;
            lbl_CardNo.Visible = false;
            tb_CardNo.Visible = false;
            lbl_Expiry.Visible = false;
            tb_Year.Visible = false;
            ddl_Month.Visible = false;
            lbl_EnterCVV.Visible = false;
            tb_CVV.Visible = false;
            lbl_CVV.Visible = false;
            img_Type.Visible = false;

            btn_Paypal.Visible = false;
            panel_Address.Visible = true;
        }
        if (ddl_SelectCard.SelectedIndex == 1)//Paypal
        {
            lbl_CardType.Visible = false;
            ddl_CardType.Visible = false;
            lbl_CardName.Visible = false;
            tb_CName.Visible = false;
            lbl_CardNo.Visible = false;
            tb_CardNo.Visible = false;
            lbl_Expiry.Visible = false;
            tb_Year.Visible = false;
            ddl_Month.Visible = false;
            lbl_EnterCVV.Visible = false;
            tb_CVV.Visible = false;
            lbl_CVV.Visible = false;
            img_Type.Visible = false;
            btn_Checkout.Visible = false;
            btn_Paypal.Visible = true;
            panel_Address.Visible = false;



        }
        if (ddl_SelectCard.SelectedIndex == 2)//New Card
        {
            img_Type.ImageUrl = "";
            lbl_CardType.Visible = true;
            ddl_CardType.Visible = true;
            lbl_CardName.Visible = true;
            tb_CName.Visible = true;
            lbl_CardNo.Visible = true;
            tb_CardNo.Visible = true;
            lbl_Expiry.Visible = true;
            tb_Year.Visible = true;
            ddl_Month.Visible = true;
            lbl_EnterCVV.Visible = true;
            tb_CVV.Visible = true;
            lbl_CVV.Visible = true;
            img_Type.Visible = true;

            ddl_CardType.Enabled = true;
            tb_CName.Enabled = true;
            tb_CardNo.Enabled = true;
            tb_Year.Enabled = true;
            ddl_Month.Enabled = true;
            tb_CVV.Enabled = true;

            btn_Paypal.Visible = false;
            panel_Address.Visible = true;

            ddl_CardType.SelectedIndex = 0;
            tb_CName.Text = "";
            tb_CardNo.Text = "";
            tb_Year.Text = "";
            ddl_Month.SelectedIndex = 0;
            tb_CVV.Text = "";
        }
        else if (ddl_SelectCard.SelectedIndex > 2)
        {
            SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * FROM UserPayment WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", ddl_SelectCard.SelectedItem.Value);
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lbl_CardType.Visible = true;
                    ddl_CardType.Visible = true;
                    lbl_CardName.Visible = true;
                    tb_CName.Visible = true;
                    lbl_CardNo.Visible = true;
                    tb_CardNo.Visible = true;
                    lbl_Expiry.Visible = true;
                    tb_Year.Visible = true;
                    ddl_Month.Visible = true;
                    lbl_EnterCVV.Visible = true;
                    tb_CVV.Visible = true;
                    lbl_CVV.Visible = true;
                    img_Type.Visible = true;

                    ddl_CardType.Enabled = false;
                    tb_CName.Enabled = false;
                    tb_CardNo.Enabled = false;
                    tb_Year.Enabled = false;
                    ddl_Month.Enabled = false;
                    tb_CVV.Enabled = true;

                    btn_Checkout.Visible = true;
                    btn_Paypal.Visible = false;
                    panel_Address.Visible = true;

                    ddl_CardType.SelectedValue = sdr["CardType"].ToString();
                    ddl_Month.SelectedValue = sdr["ExpiryMonth"].ToString();
                    tb_CName.Text = sdr["Name"].ToString();
                    tb_CardNo.Text = sdr["CardNo"].ToString();
                    tb_Year.Text = sdr["ExpiryYear"].ToString();

                    string value = sdr["CardType"].ToString();
                    cardTypeImage(value);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }

    //PP BTN
    protected void btn_Paypal_Click(object sender, EventArgs e)
    {
        var totalPrice = Session["FinalPrice"];
        string orderId = Request.QueryString["Id"];
        Session["PaypalOrderId"] = orderId;
        
        string price = Convert.ToString(totalPrice);
        string business = "ernestygritteleslie-facilitator@gmail.com";
        string itemName = "BTYM Service";
        string currencycode = "SGD";

        //string cancel_url="";
        //string return_url="";

        StringBuilder paypal = new StringBuilder();
        paypal.Append("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick");
        paypal.Append("&business=" + business);
        paypal.Append("&item_Name=" + itemName);
        paypal.Append("&amount=" + price);
        paypal.Append("&currency_code=" + currencycode);
        //paypal.Append("&return_url=" +return_url);

        Response.Redirect(paypal.ToString());
    }

    //Checkout Button
    protected void btn_Checkout_Click(object sender, EventArgs e)
    {
        string couponUsed = Session["CouponUsed"].ToString();
        string orderId = Request.QueryString["Id"];
        var expiryDate = ddl_Month.SelectedValue + "/" + tb_Year.Text;
        var results = CardChecker.checkCard(tb_CardNo.Text);
        var validity = CardChecker.isValid(expiryDate);
        int points = Coupon.pointsEarned(Convert.ToInt32(Session["FinalPrice"]));
        string datetime = DateTime.Now.ToString("yyyy-MM-dd  HH:mm:ss");
        var CardUsed = (String)null;
        var AddressUsed = (String)null;
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);

        //string query3 = "INSERT INTO [Order](CardId, AddressId, CreatedDateTime,Price,PointsEarned,UserId,CouponUsed) " +
        //    "VALUES ((SELECT Id FROM [UserPayment] WHERE Id= @Id), (SELECT Id FROM[UserAddress] WHERE Id = @Id2), @CreatedDateTime,@Price, @PointsEarned,@UserId,@CouponUsed )";

        string query3 = "UPDATE [Order]" +
            "SET CardId = (SELECT Id FROM [UserPayment] WHERE Id= @CardId)" +
            ", AddressId = (SELECT Id FROM [UserAddress] WHERE Id = @AddressId)" +
            ", CreatedDateTime = @CreatedDateTime" +
            ", PointsEarned =  @PointsEarned" +
            ", CouponUsed = @CouponUsed" +
            ", Status = @Status" +
            ", Duration = @Duration" +
            " WHERE Id = " + orderId;

        string query2 = "insert into [UserPayment](CardNo, CardType, Name, ExpiryMonth, ExpiryYear, UserId) Values(@CardNo, @CardType, @Name, @ExpiryMonth, @ExpiryYear, @UserId)";
        string query1 = "insert into [UserAddress](ReferenceName, FName, LName, AddressLine1, AddressLine2, Postcode, ContactNo, UserId) Values(@ReferenceName, @FName, @LName, @AddressLine1, @AddressLine2, @Postcode, @ContactNo, @UserId)";
        string query4 = "SELECT Max (Id) FROM [Order]";
        string query5 = "SELECT Max (Id) FROM [UserAddress]";
        string query6 = "SELECT Max (Id) FROM [UserPayment]";
        string query7 = "UPDATE [User] SET Points = Points + @PointsEarned WHERE Id = @UserId";

        SqlCommand count = new SqlCommand(); //For Session OrderID
        count.CommandText = query4;
        count.Connection = con;

        SqlCommand newadd = new SqlCommand(); //For New Address/Card
        newadd.Parameters.AddWithValue("@UserId", Session["UserId"]);
        SqlCommand newaddcount = new SqlCommand();
        newaddcount.Connection = con;

        SqlCommand cmd = new SqlCommand(); //Main SQLCOMMAND
        cmd.Connection = con;
        con.Open();

        if (validity && results && Session["free"].Equals(0))
        {

            if (ddl_SelectCard.SelectedIndex == 2 && ddl_SelectAddress.SelectedIndex > 1) //NEW CARD
            {
                newadd.Parameters.AddWithValue("@CardNo", tb_CardNo.Text);
                newadd.Parameters.AddWithValue("@CardType", ddl_CardType.SelectedValue);
                newadd.Parameters.AddWithValue("@Name", tb_CName.Text);
                newadd.Parameters.AddWithValue("@ExpiryMonth", ddl_Month.SelectedValue);
                newadd.Parameters.AddWithValue("@ExpiryYear", tb_Year.Text);
                newadd.CommandText = query2;
                newadd.Connection = con;
                newadd.ExecuteNonQuery();
                newaddcount.CommandText = query6;
                CardUsed = newaddcount.ExecuteScalar().ToString();
                AddressUsed = ddl_SelectAddress.SelectedItem.Value;
            }
            else if (ddl_SelectAddress.SelectedIndex == 1 && ddl_SelectCard.SelectedIndex > 2) //NEW ADDRESS
            {
                newadd.Parameters.AddWithValue("@ReferenceName", tb_RefName.Text);
                newadd.Parameters.AddWithValue("@FName", tb_FName.Text);
                newadd.Parameters.AddWithValue("@LName", tb_LName.Text);
                newadd.Parameters.AddWithValue("@AddressLine1", tb_Address1.Text);
                newadd.Parameters.AddWithValue("@AddressLine2", tb_Address2.Text);
                newadd.Parameters.AddWithValue("@Postcode", tb_Zip.Text);
                newadd.Parameters.AddWithValue("@ContactNo", tb_Phone.Text);
                newadd.CommandText = query1;
                newadd.Connection = con;
                newadd.ExecuteNonQuery();
                newaddcount.CommandText = query5;
                CardUsed = ddl_SelectCard.SelectedItem.Value;
                AddressUsed = newaddcount.ExecuteScalar().ToString();
            }
            else if (ddl_SelectAddress.SelectedIndex == 1 && ddl_SelectCard.SelectedIndex == 2) //NEW BOTH
            {
                newadd.Parameters.AddWithValue("@CardNo", tb_CardNo.Text);
                newadd.Parameters.AddWithValue("@CardType", ddl_CardType.SelectedValue);
                newadd.Parameters.AddWithValue("@Name", tb_CName.Text);
                newadd.Parameters.AddWithValue("@ExpiryMonth", ddl_Month.SelectedValue);
                newadd.Parameters.AddWithValue("@ExpiryYear", tb_Year.Text);

                newadd.Parameters.AddWithValue("@ReferenceName", tb_RefName.Text);
                newadd.Parameters.AddWithValue("@FName", tb_FName.Text);
                newadd.Parameters.AddWithValue("@LName", tb_LName.Text);
                newadd.Parameters.AddWithValue("@AddressLine1", tb_Address1.Text);
                newadd.Parameters.AddWithValue("@AddressLine2", tb_Address2.Text);
                newadd.Parameters.AddWithValue("@Postcode", tb_Zip.Text);
                newadd.Parameters.AddWithValue("@ContactNo", tb_Phone.Text);
                string[] array = { query1, query2 };
                string arrayjoin = string.Join(";", array);
                newadd.CommandText = arrayjoin;
                newadd.Connection = con;
                newadd.ExecuteNonQuery();
                newaddcount.CommandText = query5;
                AddressUsed = newaddcount.ExecuteScalar().ToString();
                newaddcount.Parameters.Clear();
                newaddcount.CommandText = query6;
                CardUsed = newaddcount.ExecuteScalar().ToString();
            }
            else
            {
                CardUsed = ddl_SelectCard.SelectedItem.Value;
                AddressUsed = ddl_SelectAddress.SelectedItem.Value;
            }
            cmd.Parameters.AddWithValue("@Duration", Session["Duration"]);
            cmd.Parameters.AddWithValue("@Status", "PAID");
            cmd.Parameters.AddWithValue("@CardId", CardUsed);
            cmd.Parameters.AddWithValue("@AddressId", AddressUsed);
            cmd.Parameters.AddWithValue("@CreatedDateTime", datetime);
            cmd.Parameters.AddWithValue("@Price", Session["FinalPrice"]);
            cmd.Parameters.AddWithValue("@PointsEarned", points);
            cmd.Parameters.AddWithValue("@CouponUsed", couponUsed);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            string[] arr = { query3, query7 };
            string allQueries = string.Join(";", arr);
            cmd.CommandText = allQueries;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            Session["OrderId"] = count.ExecuteScalar();
            con.Close();
            Coupon.setUsed(couponUsed);
            Response.Redirect("~/UserPages/Receipt.aspx");
        }
        else if (validity && Session["free"].Equals(0))
        {

            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Invalid Credit Card Number.");
        }
        else if (results && Session["free"].Equals(0))
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Your Card has expired.");
        }

        else if (Session["free"].Equals(1))
        {
            panel_Address.Visible = true;
            if (ddl_SelectAddress.SelectedIndex > 1)
            {
                AddressUsed = ddl_SelectAddress.SelectedItem.Value;
            }
            else if (ddl_SelectAddress.SelectedIndex == 1)
            {
                newadd.Parameters.AddWithValue("@ReferenceName", tb_RefName.Text);
                newadd.Parameters.AddWithValue("@FName", tb_FName.Text);
                newadd.Parameters.AddWithValue("@LName", tb_LName.Text);
                newadd.Parameters.AddWithValue("@AddressLine1", tb_Address1.Text);
                newadd.Parameters.AddWithValue("@AddressLine2", tb_Address2.Text);
                newadd.Parameters.AddWithValue("@Postcode", tb_Zip.Text);
                newadd.Parameters.AddWithValue("@ContactNo", tb_Phone.Text);
                newadd.CommandText = query1;
                newaddcount.CommandText = query5;
                newadd.Connection = con;
                newadd.ExecuteNonQuery();
                AddressUsed = newaddcount.ExecuteScalar().ToString();
                
            }
            cmd.Parameters.AddWithValue("@Duration", Session["Duration"]);
            cmd.Parameters.AddWithValue("@Status", "PAID");
            cmd.Parameters.AddWithValue("@CardId", "1");
            cmd.Parameters.AddWithValue("@AddressId", AddressUsed);
            cmd.Parameters.AddWithValue("@CreatedDateTime", datetime);
            cmd.Parameters.AddWithValue("@Price", Session["FinalPrice"]);
            cmd.Parameters.AddWithValue("@PointsEarned", points);
            cmd.Parameters.AddWithValue("@CouponUsed", couponUsed);
            string[] arr = { query3 };
            string allQueries = string.Join(";", arr);
            cmd.CommandText = allQueries;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            Session["OrderId"] = count.ExecuteScalar();
            con.Close();
            Coupon.setUsed(couponUsed);
            Response.Redirect("~/UserPages/Receipt.aspx");
        }
        else
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Card number is invalid and/or expired.");
        }
    }

    //Use Coupon
    protected void btn_Coupon_Click(object sender, EventArgs e)
    {
        var results = Coupon.checkCodeExists(tb_Coupon.Text);
        if (results)
        {
            Session["CouponUsed"] = tb_Coupon.Text;
            decimal discount = Coupon.getDiscount(tb_Coupon.Text);

            decimal round = Convert.ToDecimal(Session["OriginalPrice"]) - discount;
            decimal FinalPrice = round;
            Session["FinalPrice"] = FinalPrice;
            if (FinalPrice < 0.01m)
            {
                Session["FinalPrice"] = 0.00m;
                panel_Payment.Visible = false;
                Session["free"] = 1;
                btn_Checkout.Visible = true;
                panel_Address.Visible = true;
            }
            else
            {
                Session["FinalPrice"] = FinalPrice;
            }
            lbl_Price.Text = Session["OriginalPrice"].ToString() + "- $" + discount + "= $" + Session["FinalPrice"].ToString();
            lbl_Coupon.Text = "Success !";

        }
        else if (!results)
        {
            Session["CouponUsed"] = null;
            lbl_Coupon.Text = "Code Non Existent/Used";
        }
    }

    //Get Unused Coupons
    public DataTable GetCoupons(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtOrd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        da.SelectCommand.Parameters.AddWithValue("@Status", "unused");
        da.Fill(dtOrd);
        return dtOrd;
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int type = int.Parse(e.Row.Cells[1].Text);

            foreach (TableCell cell in e.Row.Cells)
            {
                if (type == 20)
                {
                    cell.BackColor = Color.LightSkyBlue;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 10)
                {
                    cell.BackColor = Color.Silver;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 5)
                {
                    cell.BackColor = Color.SandyBrown;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
                if (type == 15)
                {
                    cell.BackColor = Color.Gold;
                    e.Row.Cells[2].ForeColor = Color.Green;
                    e.Row.Cells[2].Text = "<b>UNUSED</b>";
                }
            }
        }
    }

    protected void btn_ViewCoupons_Click(object sender, EventArgs e)
    {
        gv_Rewards.DataSource = GetCoupons("SELECT * FROM [Coupons] WHERE [UserId] = @UserId AND [Status] = @Status ORDER BY cast([CouponType] as int)");
        gv_Rewards.DataBind();
        Panel_Rewards.Visible = true;
        btn_ViewCoupons.Visible = false;
        btn_HideCoupons.Visible = true;
    }

    protected void btn_HideCoupons_Click(object sender, EventArgs e)
    {
        Panel_Rewards.Visible = false;
        btn_ViewCoupons.Visible = true;
        btn_HideCoupons.Visible = false;
    }
}

  
