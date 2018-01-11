using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PaypalConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            insertOrder();
            getOrder();
        }
    }

    protected void getOrder()
    {
        Session["OrderId"] = Session["PaypalOrderId"];
    }

    protected void insertOrder()
    {
        string query2 = "UPDATE [User] SET Points = Points + @PointsEarned WHERE Id = @UserId";
        //string query = "UPDATE [Order] SET (CardId, AddressId,CreatedDateTime,Price,PointsEarned,CouponUsed,Duration,Status) VALUES (@CardId, @AddressId, @CreatedDateTime,@Price, @PointsEarned,@UserId,@CouponUsed,@Duration,@Status) WHERE Id = @Id";
        string query = "UPDATE [Order]" +
           "SET CardId = @CardId" +
           ", AddressId = @AddressId" +
           ", CreatedDateTime = @CreatedDateTime" +
           ", PointsEarned =  @PointsEarned" +
           ", CouponUsed = @CouponUsed" +
           ", Status = @Status" +
           ", Duration = @Duration" +
           ", Price = @Price" +
           " WHERE Id = @Id";
        SqlConnection con = new SqlConnection(DbHelper.ConnectionString);
        string[] arr = { query, query2 };
        string allQueries = string.Join(";", arr);
        SqlCommand cmd = new SqlCommand(allQueries, con);
        cmd.Parameters.AddWithValue("@Id", Session["PaypalOrderId"]);
        cmd.Parameters.AddWithValue("@Duration", Session["Duration"]);
        cmd.Parameters.AddWithValue("@Status", "PAID");
        cmd.Parameters.AddWithValue("@CardId", "0");
        cmd.Parameters.AddWithValue("@AddressId", "0");
        cmd.Parameters.AddWithValue("@CreatedDateTime", DateTime.Now.ToString("yyyy-MM-dd  HH:mm:ss"));
        cmd.Parameters.AddWithValue("@Price", Session["FinalPrice"]);
        cmd.Parameters.AddWithValue("@PointsEarned", Coupon.pointsEarned(Convert.ToDecimal(Session["FinalPrice"])));
        cmd.Parameters.AddWithValue("@CouponUsed", Session["CouponUsed"]);
        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
        Coupon.setUsed(Session["CouponUsed"].ToString());

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
}