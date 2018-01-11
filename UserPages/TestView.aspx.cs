using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestView : System.Web.UI.Page
{
    Reviews aReview = new Reviews();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
        decimal a = 0, b = 0, c = 0;
        for (int i = 0; i < (gvReviews.Rows.Count); i++)
        {
            a = Convert.ToDecimal(gvReviews.Rows[i].Cells[1].Text.ToString());
            c +=Math.Round( a / gvReviews.Rows.Count, 2);
            lbl_AverageRating.Text = c.ToString();
        }
    }

    protected void bind()
    {
        List<Reviews> reviewList = new List<Reviews>();
        reviewList = aReview.getReviewsAll();
        gvReviews.DataSource = reviewList;
        gvReviews.DataBind();
    }
    protected void gvReviews_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvReviews_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        int result = 0;
        Reviews review = new Reviews();
        string categoryID = gvReviews.DataKeys[e.RowIndex].Value.ToString();
        result = review.ReviewsDelete(categoryID);
        
       
        if (result > 0)
        {
            Response.Write("<script>alert('Review removed successfully');</script");
        }
        else
        {
            Response.Write("<script>alert('Error. Try Again.');</script");
        }
        Response.Redirect("~/UserPages/TestView.aspx");
    }

    protected void tb_Write_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserPages/WriteReview.aspx");
    }

    protected Boolean IsUserLoggedIn(string UserId)
    {
        return UserId == "James";
    }

    protected void gvReviews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       /* string user;
        for (int i = 0; i < (gvReviews.Rows.Count); i++)
        {
        user = gvReviews.Rows[i].Cells[0].Text.ToString();
        if (e.Row.RowType == DataControlRowType.DataRow)

        {
                if (user == "James")
                {
                    LinkButton cmdField = (LinkButton)e.Row.Cells[3].Controls[0];
                    cmdField.Visible = false;
                }
                else if (user != "James")
                {
                    if (e.Row.RowType != DataControlRowType.DataRow)
                    {
                        LinkButton cmdField = (LinkButton)e.Row.Cells[3].Controls[0];
                        cmdField.Visible = false;
                    }
                }
               
         
           }

        }

        */  
          
      
    }
    
}