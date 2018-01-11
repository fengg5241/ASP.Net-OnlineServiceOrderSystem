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

public partial class PaymentMethods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Add.Attributes.Add("onmouseover", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddCard2.jpg") + "'");
            btn_Add.Attributes.Add("onmouseout", "this.src= '" + this.Page.ResolveClientUrl("~/Images/AddCard.jpg") + "'");
            lv_Card.DataSource = GetCard("Select * from UserPayment WHERE [Id] > 1 AND [UserId] = @UserId");
            lv_Card.DataBind();
        }
    }

    protected void btn_Add_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/UserPages/AddCard.aspx");
    }

    public static string GetImage(string value)
    {
        if (value.Equals("AMEX"))
        {
            return "~/Images/amexLogo.png";
        }
        else if (value.Equals("Mastercard"))
        {
            return "~/Images/mastercardLogo.png";
        }
        else if (value.Equals("Visa"))
        {
            return "~/Images/visaLogo.png";
        }
        else
        {
            return "";
        }
    }
    protected void OnItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (lv_Card.EditIndex == (e.Item as ListViewDataItem).DataItemIndex)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("CardType"));
            dt.Rows.Add("AMEX");
            dt.Rows.Add("Mastercard");
            dt.Rows.Add("Visa");
            DropDownList ddl = (e.Item.FindControl("list_Type") as DropDownList);
            ddl.DataSource = dt;
            ddl.DataTextField = "CardType";
            ddl.DataValueField = "CardType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select Card Type", "0"));
        }
    }

    public DataTable GetCard(string query)
    {
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dtAdd = new DataTable();
        da.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        da.Fill(dtAdd);
        return dtAdd;
    }
    protected void lv_Card_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        lv_Card.EditIndex = e.NewEditIndex;
        lv_Card.DataSource = GetCard("Select * from UserPayment WHERE Id > 1  AND [UserId] = @UserId");
        lv_Card.DataBind();
    }
    protected void lv_Card_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        lv_Card.EditIndex = -1;
        lv_Card.DataSource = GetCard("Select * from UserPayment WHERE Id > 1  AND [UserId] = @UserId");
        lv_Card.DataBind();
    }
    protected void lv_Card_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string Cardindex = "";
        Label lbl = (lv_Card.Items[e.ItemIndex].FindControl("lbl_Id")) as Label;
        if (lbl != null)
            Cardindex = lbl.Text;
        string DeleteQuery = "Delete from UserPayment WHERE [Id] = '" + Cardindex + "'";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        string[] array = { DeleteQuery };
        string arrayjoin = string.Join(";", array);
        con.Open();
        SqlCommand com = new SqlCommand();
        com.CommandText = arrayjoin;
        com.Connection = con;
        com.ExecuteNonQuery();
        con.Close();
        lv_Card.EditIndex = -1;
        lv_Card.DataSource = GetCard("Select * from UserPayment WHERE Id > 1  AND [UserId] = @UserId");
        lv_Card.DataBind();
    }
    protected void lv_Card_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        string Id = "", Name = "", CardNo = "", ExpiryMonth = "", ExpiryYear = "";
        Label lbl = (lv_Card.Items[e.ItemIndex].FindControl("lbl_Id")) as Label;
        Label control = (lv_Card.Items[e.ItemIndex].FindControl("control")) as Label;
        if (lbl != null)
            Id = lbl.Text;
        TextBox txt = (lv_Card.Items[e.ItemIndex].FindControl("tb_Name")) as TextBox;
        if (txt != null)
            Name = txt.Text;
        txt = (lv_Card.Items[e.ItemIndex].FindControl("tb_CardNo")) as TextBox;
        if (txt != null)
            CardNo = txt.Text;
        txt = (lv_Card.Items[e.ItemIndex].FindControl("tb_Month")) as TextBox;
        if (txt != null)
            ExpiryMonth = txt.Text;
        txt = (lv_Card.Items[e.ItemIndex].FindControl("tb_Year")) as TextBox;
        if (txt != null)
            ExpiryYear = txt.Text;
        string type = (lv_Card.Items[e.ItemIndex].FindControl("list_Type") as DropDownList).SelectedItem.Value;
        //See if it works
        string expiryDate = ExpiryMonth + "/" + ExpiryYear;
        var validity = CardChecker.isValid(expiryDate);
        var results = CardChecker.checkCard(CardNo);
        if (results && validity)
        {
            string UpdateQuery = "UPDATE [UserPayment] SET [CardType] = '" + type + "', [Name] = '" + Name + "', [CardNo] = '" + CardNo + "',[ExpiryMonth] = '" + ExpiryMonth + "',[ExpiryYear] = '" +ExpiryYear + "' WHERE [Id] = '" + Id + "'";
            SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand(UpdateQuery, con);
            com.ExecuteNonQuery();
            con.Close();
            lv_Card.EditIndex = -1;
            lv_Card.DataSource = GetCard("Select * from UserPayment WHERE Id > 1  AND [UserId] = @UserId");
            lv_Card.DataBind();
        }
        else if (validity)
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Invalid Credit Card Number.");
        }
        else if (results)
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Your Card has expired and/or Invalid Date Format.");
        }
        else
        {
            control.ForeColor = System.Drawing.Color.Red;
            control.Text = ("Card number is invalid and/or expired.");
        }
    }

}