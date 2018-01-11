<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="UserAddress.aspx.cs" Inherits="UserAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Additional Information</h2>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Address (Line 1):</td>
            <td>
                <asp:TextBox ID="tbUserAddress1" runat="server" Width="268px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Address (Line 2):</td>
            <td>
                <asp:TextBox ID="tbAddress2" runat="server" Width="270px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Postal Code:</td>
            <td>
                <asp:TextBox ID="tbPostalCode" runat="server" Width="270px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" Width="142px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />

</asp:Content>

