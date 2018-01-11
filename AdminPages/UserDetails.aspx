<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
       .table{
           font-size: 30px;
       }
        .auto-style4 {
            width: 104px;
        }
        .auto-style5 {
            width: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2>User Details</h2>
    <table class="table">
        <tr>
            <td class="auto-style5" rowspan="5">
                <asp:Image runat="server" Height="107px" Width="103px" />
            </td>
            <td class="auto-style4">
                <asp:Label ID="lbl_UserName" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbl_UserEmail" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbl_UserPhoneNo" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="lblUserGender" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        </table>
        &nbsp;User ID = <asp:Label ID="lbl_UserID" runat="server"></asp:Label>



</asp:Content>

