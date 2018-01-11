<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #TextArea1 {
            height: 133px;
            width: 350px;
        }
        #txt_Comments {
            height: 175px;
            width: 350px;
        }
        .auto-style3 {
            height: 60px;
        }
        .auto-style4 {
            width: 51px;
        }
        fieldset
        {
            background-color :#cccccc ;
            border-radius: 15px;
            border-color: #51AAC3;
        }
        legend
        {
            font-size:1.1em;
            color: #4FABC2;
            font-weight:bold;
        }
        .button
        {
            border-radius:5px;
            border-color: #51AAC3;
            background-color: lightgray;
            color: #51AAC3;
            font-family: 'Century Gothic';
            font-weight: bold;
        }
        .button:hover
        {
            background-color: #787878;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div class="body">
            <div class="ContactForm">
             <h1>Contact Us</h1>
            <form>
            <fieldset style="width: 707px">
            <legend>Contact Form</legend>
            <table>
                <tr>
                    <td><b>First Name:</b></td>
                    <td><asp:TextBox ID="tb_FName" runat="server" Width="350px"></asp:TextBox> </td>
                    <td class="auto-style4"><asp:RequiredFieldValidator ID="FNameValidator" runat="server" Text="*" ErrorMessage="First Name Required" ControlToValidate="tb_FName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><b>Last Name:</b></td>
                    <td ><asp:TextBox ID="tb_LName" runat="server" Width="350px"></asp:TextBox> </td>
                    <td class="auto-style4"><asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="Last Name Required" ControlToValidate="tb_LName" Text="*" ForeColor="Red">
                         </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><b>Email:</b></td>
                    <td><asp:TextBox ID="tb_Email" runat="server" Width="350px"></asp:TextBox> </td>
                    <td class="auto-style4"> <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="Email Required" ControlToValidate="tb_Email" Text="*" ForeColor="Red" Display="Dynamic">
                         </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailExpressValidator" runat="server" ErrorMessage="Email Format Invalid" ControlToValidate="tb_Email" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>Order Number (if applicable):</b></td>
                    <td><asp:TextBox ID="tb_OrderNo" runat="server" Width="350px"></asp:TextBox> </td>
                    <td class="auto-style4"></td>
                </tr>
                 <tr>
                    <td><b>Subject:</b></td>
                    <td><asp:TextBox ID="tb_Subject" runat="server" Width="350px"></asp:TextBox> </td>
                    <td class="auto-style4"> <asp:RequiredFieldValidator ID="SubjectValidator" runat="server" ErrorMessage="Subject Required" ControlToValidate="tb_Subject" Text="*" ForeColor="Red">
                         </asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td style="vertical-align:top"><b>Comments:</b></td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="tb_Comments" runat="server" Width="350px" TextMode="MultiLine" Rows="8"></asp:TextBox>
                     </td>
                    <td class="auto-style4" style="vertical-align:top">
                        <asp:RequiredFieldValidator ID="CommentsValidator" runat="server" ErrorMessage="Comments Required" Text="*" ForeColor="Red" ControlToValidate="tb_Comments"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red" />
                    </td>      
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="control" runat="server" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                   <td colspan="3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="137px" OnClick="btnSubmit_Click"  CssClass="button"/>
                    </td>
               </tr>
            </table>
            </fieldset>
         </form>
        </div>
        </div>
</asp:Content>


