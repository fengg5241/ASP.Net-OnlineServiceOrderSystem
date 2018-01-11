<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="CreateTicket.aspx.cs" Inherits="CreateTicket" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .body{
        margin-left:30%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="body">
        <h3>Create an Anonymous Ticket To Your Expert</h3>
        <form>
           <table>
               <tr>
                  <td style="font-size:1.1em;" colspan="3"><b>Select A Payment Method</b></td>
               </tr>
               <tr>
                  <td colspan="3" class="auto-style1">
                  <asp:DropDownList ID="ddl_SelectOrder" runat="server" Width="335px" AutoPostBack = "true" />
                  <asp:RequiredFieldValidator ID="SelectOrderValidator" runat="server" ErrorMessage="No Order Selected" ControlToValidate="ddl_SelectOrder" InitialValue="0" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                   </td>
                </tr>
               <tr>
                   <td><b>Enter a Title: </b></td>
                   <td><asp:TextBox ID ="tb_Title" runat="server"></asp:TextBox></td>
                   <td><asp:RequiredFieldValidator ID="rfv_title" ControlToValidate="tb_Title" Text="*" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Title Required"></asp:RequiredFieldValidator></td>
               </tr>
               <tr>
                    <td colspan="3"><asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red" /></td>      
               </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="control" runat="server" ForeColor="Red" /></td>      
               </tr>
               <tr>
                   <td colspan="3"><asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" /></td>
               </tr>
           </table>
        </form>
    </div>
</asp:Content>

