<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <%--    <asp:Button ID="Button1" runat="server" Text="SESSION 1" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="SESSION 2" OnClick="Button2_Click" />
    <asp:TextBox ID="TextBox1" runat="server" Placeholder="PostalCode" MaxLength="6"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="VIEW ON GOOGLE MAPS" OnClick="Button3_Click" />--%>
    <table width="900" align="center">
        <tr>
            <td width="300" align="center">
                <asp:LinkButton ID="btnExpertLogin" runat="server" PostBackUrl="~/GuestPages/ExpertLogin.aspx" Text="Expert Login"></asp:LinkButton>
            </td>
            <td widht="300" align="center">
                <asp:LinkButton ID="btnUserLogin" runat="server" PostBackUrl="~/GuestPages/UserLogin.aspx" Text="User Login"></asp:LinkButton>
            </td>
            <td width="300" align="center">
                <asp:LinkButton ID="btnAdminLogin" runat="server" PostBackUrl="~/GuestPages/AdminLogin.aspx" Text="Admin Login"></asp:LinkButton>
            </td>
        </tr>
    </table>

</asp:Content>

