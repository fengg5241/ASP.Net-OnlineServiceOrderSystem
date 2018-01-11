using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlockListPage : System.Web.UI.Page
{
    BlockList aBlo = new BlockList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }

    }
    protected void bind()
    {
        List<BlockList> blockList = new List<BlockList>();
        blockList = aBlo.getBlockListAll();
        gvBlockList.DataSource = blockList;
        gvBlockList.DataBind();

    }


    protected void gvBlockList_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvBlockList.SelectedRow;

        string Id = row.Cells[0].Text;

    }





    protected void gvBlockList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvBlockList.EditIndex = e.NewEditIndex;
        bind();

    }
    protected void gvBlockList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int result = 0;
        BlockList blo = new BlockList();
        GridViewRow row = (GridViewRow)gvBlockList.Rows[e.RowIndex];
        // int id = int.Parse(gvBlockList.SelectedRow.Cells[0].Text);
        int id = int.Parse(gvBlockList.DataKeys[e.RowIndex].Value.ToString());
        // string tid = ((TextBox)row.Cells[0].Controls[0]).Text;
        // string userName = ((TextBox)row.Cells[1].Controls[0]).Text;
        // string gender = ((TextBox)row.Cells[2].Controls[0]).Text;
        // string dateOfBirth = ((TextBox)row.Cells[3].Controls[0]).Text;
        Boolean enabled = Convert.ToBoolean(((TextBox)row.Cells[5].Controls[0]).Text);

        result = blo.BlockListUpdate(id, enabled);
        if (result > 0)
        {
            Response.Write("<script>alert('BlockList updated successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('BlockList NOT updated');</script>");
        }
        gvBlockList.EditIndex = -1;
        bind();
    }









protected void gvBlockList_SelectedIndexChanged1(object sender, EventArgs e)
    {
        MailMessage mailMessage = new MailMessage();
        mailMessage.From = new MailAddress("btymhelp@gmail.com"); //GET USER'S EMAIL FROM DATABASE
        mailMessage.To.Add(aBlo.Email);
        mailMessage.Subject = "Warning! ";

        mailMessage.Body = "Your account has been blocked. Please contact our administrator. ";
        mailMessage.IsBodyHtml = true;

        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
        smtpClient.EnableSsl = true;
        smtpClient.Credentials = new System.Net.NetworkCredential("btymhelp@gmail.com", "ernestleslie");
        smtpClient.Send(mailMessage);
    }
}