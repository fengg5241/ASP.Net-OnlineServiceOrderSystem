using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for OrderDetails
/// </summary>
public class ExpOrderDetails
{
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    private int orderNo;
    private string name;
    private string gender;
    private string address;
    private string postalCode;
    private string hp;
    private string email;
    private string serviceDesc;
    private string timeslot;
    private decimal price;
    private string date;
    private string serviceType;
    private string image;

    public ExpOrderDetails()
    {

    }

    public ExpOrderDetails(int orderNo, string name, string gender, string address, string postalCode, string hp, string email, string serviceDesc, string timeslot, decimal price, string date, string serviceType,string image)
    {
        this.orderNo = orderNo;
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.postalCode = postalCode;
        this.hp = hp;
        this.email = email;
        this.serviceDesc = serviceDesc;
        this.timeslot = timeslot;
        this.price = price;
        this.date = date;
        this.serviceType = serviceType;
        this.image = image;
    }
    public int OrderNo
    {
        get
        {
            return orderNo;
        }

        set
        {
            orderNo = value;
        }
    }

    public string Name
    {
        get
        {
            return name;
        }

        set
        {
            name = value;
        }
    }

    public string Gender
    {
        get
        {
            return gender;
        }

        set
        {
            gender = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string PostalCode
    {
        get
        {
            return postalCode;
        }

        set
        {
            postalCode = value;
        }
    }

    public string HP
    {
        get
        {
            return hp;
        }

        set
        {
            hp = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    public string ServiceDesc
    {
        get
        {
            return serviceDesc;
        }

        set
        {
            serviceDesc = value;
        }
    }

    public string Timeslot
    {
        get
        {
            return timeslot;
        }

        set
        {
            timeslot = value;
        }
    }

    public decimal Price
    {
        get
        {
            return price;
        }

        set
        {
            price = value;
        }
    }

    public string Date
    {
        get
        {
            return date;
        }

        set
        {
            date = value;
        }
    }

    public string ServiceType
    {
        get
        {
            return serviceType;
        }

        set
        {
            serviceType= value;
        }
    }

    public string Image
    {
        get
        {
            return image;
        }

        set
        {
            image = value;
        }
    }



    public ExpOrderDetails getExpOrderDetails(int orderNo)
    {
        ExpOrderDetails orderDetails = null;
        string Name, Gender, Address, PostalCode, HP, Email, ServiceDesc, Timeslot,Date,ServiceType,Image;
        decimal Price;
        int OrderNo;
        string queryStr = "SELECT * FROM OrderDetails WHERE OrderNo = @OrderNO";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@OrderNo", orderNo);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            OrderNo = int.Parse(dr["OrderNo"].ToString());
            Name = dr["Name"].ToString();
            Address = dr["Address"].ToString();
            PostalCode = dr["PostalCode"].ToString();
            ServiceDesc = dr["ServiceDesc"].ToString();
            //Prod_Image = dr["Product_Image"].ToString();
            //Price = decimal.Parse(dr["Price"].ToString());
            Price = 15;
            Gender = dr["Gender"].ToString();
            HP = dr["HP"].ToString();
            Email = dr["Email"].ToString();
            //Timeslot = dr["Timeslot"].ToString();
            Timeslot = "11:00-13:00";
            Date = dr["Date"].ToString();
            ServiceType = dr["ServiceType"].ToString();
            Image = dr["Image"].ToString();

            orderDetails = new ExpOrderDetails(OrderNo, Name, Gender, Address, PostalCode, HP, Email, ServiceDesc, Timeslot, Price,Date,ServiceType,Image);
        }
        else
        {
            orderDetails = null;
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return orderDetails;
    }
    public List<ExpOrderDetails> getExpOrderDetailsAll()
    {
        List<ExpOrderDetails> orderDetailsList = new List<ExpOrderDetails>();
        string Name, Gender,Address, PostalCode, HP, Email, ServiceDesc, Timeslot,Date,ServiceType,Image;
        decimal Price;
        int OrderNo;
        string queryStr = "SELECT * FROM OrderDetails Order By OrderNo";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderNo = int.Parse(dr["OrderNo"].ToString());
            Name = dr["Name"].ToString();
            Address = dr["Address"].ToString();
            PostalCode = dr["PostalCode"].ToString();
            ServiceDesc = dr["ServiceDesc"].ToString();
            
            //Price = decimal.Parse(dr["Price"].ToString());
            Price = 15;
            Gender = dr["Gender"].ToString();
            HP = dr["HP"].ToString();
            Email = dr["Email"].ToString();
            Timeslot = dr["Timeslot"].ToString();
            Date = dr["Date"].ToString();
            ServiceType = dr["ServiceType"].ToString();
            Image = dr["Image"].ToString();


            ExpOrderDetails od = new ExpOrderDetails(OrderNo, Name, Gender, Address, PostalCode, HP, Email, ServiceDesc, Timeslot, Price,Date,ServiceType,Image);
            orderDetailsList.Add(od);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return orderDetailsList;
    }

    public int ExpOrderDetailsDelete(int orderNo)
    {
        string queryStr = "DELETE FROM OrderDetails WHERE OrderNo=@orderNo";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@orderNo", orderNo);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }

     
}