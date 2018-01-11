using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Rewards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getUser();
        btn_Coupon.Attributes.Add("onmouseover", "this.src= '" + this.Page.ResolveClientUrl("~/Images/ViewCoupon2.jpg") + "'");
        btn_Coupon.Attributes.Add("onmouseout", "this.src= '" + this.Page.ResolveClientUrl("~/Images/ViewCoupon.jpg") + "'");
    }

    protected void btn_500_Click(object sender, EventArgs e)
    {
        int cost = 50;
        int userPoints = Convert.ToInt32(lbl_balance.Text);
        var results = Coupon.checkPoints(userPoints, 50);
        if (results)
        {
            string code = Coupon.generateReward(10);
            bool noDuplicate = Coupon.checkDuplicate(code);
            if (noDuplicate)
            {
                Coupon.storeCoupon(code, "5", "unused", Session["UserId"].ToString());
                Coupon.deductPoints(cost, Session["UserId"].ToString());
                tb_500.Text = code;
                lbl_500.Text = "Success!";
                lbl_balance.Text = (userPoints - cost).ToString();
                UserMasterPage site = this.Master as UserMasterPage;
                if (site != null)
                {
                    Label header = site.FindControl("lbl_points") as Label;
                    int points = Convert.ToInt32(header.Text);
                    header.Text = (points - cost).ToString();
                    if (points - cost < 50)
                    {
                        Image notifications = site.FindControl("img_notification") as Image;
                        notifications.Visible = false;
                    }
                }
            }
            else
            {
                tb_500.Text = "ERROR";
                lbl_500.Text = "Sorry, an Error Occured, Please try again.";
            }
        }
        else
        {
            lbl_500.Text = "You have insufficient points !";
            tb_500.Text = "";
        }
        
    }

    protected void btn_1000_Click(object sender, EventArgs e)
    {
        int cost = 100;
        int userPoints = Convert.ToInt32(lbl_balance.Text);
        var results = Coupon.checkPoints(userPoints, 100);
        if (results)
        {
            string code = Coupon.generateReward(10);
            bool noDuplicate = Coupon.checkDuplicate(code);
            if (noDuplicate)
            {
                Coupon.storeCoupon(code, "10", "unused", Session["UserId"].ToString());
                Coupon.deductPoints(cost, Session["UserId"].ToString());
                tb_1000.Text = code;
                lbl_1000.Text = "Success!";
                lbl_balance.Text = (userPoints - cost).ToString();
                UserMasterPage site = this.Master as UserMasterPage;
                if (site != null)
                {
                    Label header = site.FindControl("lbl_points") as Label;
                    int points = Convert.ToInt32(header.Text);
                    header.Text = (points - cost).ToString();
                    if (points - cost < 50)
                    {
                        Image notifications = site.FindControl("img_notification") as Image;
                        notifications.Visible = false;
                    }
                }
            }
            else
            {
                tb_1000.Text = "ERROR";
                lbl_1000.Text = "Sorry, an Error Occured, Please try again.";
            }
        }
        else
        {
            lbl_1000.Text = "You have insufficient points !";
            tb_1000.Text = "";
        }

    }

    protected void btn_1500_Click(object sender, EventArgs e)
    {
        int cost = 150;
        int userPoints = Convert.ToInt32(lbl_balance.Text);
        var results = Coupon.checkPoints(userPoints, 150);
        if (results)
        {
            string code = Coupon.generateReward(10);
            bool noDuplicate = Coupon.checkDuplicate(code);
            if (noDuplicate)
            {
                Coupon.storeCoupon(code, "15", "unused", Session["UserId"].ToString());
                Coupon.deductPoints(cost, Session["UserId"].ToString());
                tb_1500.Text = code;
                lbl_1500.Text = "Success!";
                lbl_balance.Text = (userPoints - cost).ToString();
                UserMasterPage site = this.Master as UserMasterPage;
                if (site != null)
                {
                    Label header = site.FindControl("lbl_points") as Label;
                    int points = Convert.ToInt32(header.Text);
                    header.Text = (points - cost).ToString();
                    if (points - cost < 50)
                    {
                        Image notifications = site.FindControl("img_notification") as Image;
                        notifications.Visible = false;
                    }
                }
            }
            else
            {
                tb_1500.Text = "ERROR";
                lbl_1500.Text = "Sorry, an Error Occured, Please try again.";
            }
        }
        else
        {
            lbl_1500.Text = "You have insufficient points !";
            tb_1500.Text = "";
        }

    }

    protected void btn_2000_Click(object sender, EventArgs e)
    {
        int cost = 200;
        int userPoints = Convert.ToInt32(lbl_balance.Text);
        var results = Coupon.checkPoints(userPoints, 200);
        if (results)
        {
            string code = Coupon.generateReward(10);
            bool noDuplicate = Coupon.checkDuplicate(code);
            if (noDuplicate)
            {
                Coupon.storeCoupon(code, "20", "unused", Session["UserId"].ToString());
                Coupon.deductPoints(cost, Session["UserId"].ToString());
                tb_2000.Text = code;
                lbl_2000.Text = "Success!";
                lbl_balance.Text = (userPoints - cost).ToString();
                UserMasterPage site = this.Master as UserMasterPage;
                if (site != null)
                {
                    Label header = site.FindControl("lbl_points") as Label;
                    int points = Convert.ToInt32(header.Text);
                    header.Text = (points - cost).ToString();
                    if (points - cost < 50)
                    {
                        Image notifications = site.FindControl("img_notification") as Image;
                        notifications.Visible = false;
                    }
                }
            }
            else
            {
                tb_2000.Text = "ERROR";
                lbl_2000.Text = "Sorry, an Error Occured, Please try again.";
            }
        }
        else
        {
            lbl_2000.Text = "You have insufficient points !";
            tb_2000.Text = "";
        }

    }

    protected void getUser()
    {    
        string user = Session["UserId"].ToString();
        string query = "SELECT (Points) FROM [User] WHERE [Id] = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Id", user);
        cmd.Connection = con;
        cmd.CommandText = query;

        SqlDataReader rdr;
        con.Open();
        cmd.ExecuteNonQuery();
        rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            lbl_balance.Text = rdr[0].ToString();
        }

        rdr.Close();
        con.Close();
    }



    protected void btn_Coupon_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/UserPages/PastRewards.aspx");
    }
}