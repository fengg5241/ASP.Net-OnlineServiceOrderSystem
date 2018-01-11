using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CustomerFAQ : System.Web.UI.Page
{
    
    FAQ aFAQ = new FAQ();
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            bind();
        }
    }

    protected void bind()
    {
        List<FAQ> FAQList = new List<FAQ>();
        FAQList = aFAQ.getFAQAll();
        gvCustomerFAQ.DataSource = FAQList;
        gvCustomerFAQ.DataBind();
    }

    protected void btn_FAQSearch_Click(object sender, EventArgs e)
    {
       
        string queryStr = "SELECT * FROM FAQ WHERE Question LIKE '%" + tb_FAQSearch.Text + "%'";
        SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
        conn.Open();
        SqlDataAdapter ad = new SqlDataAdapter(queryStr, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        conn.Close();
        gvCustomerFAQ.DataSource = ds;
        gvCustomerFAQ.DataBind();
        conn.Close();


    }


}