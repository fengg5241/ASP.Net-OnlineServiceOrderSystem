<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        h1 {
            text-decoration: underline;
            font-weight: bold;
            font-size: 65px;
            color: #003399;
            text-shadow: 2px 2px 5px #1F1209;
        }

        .Btn {
            font-family: 'Trebuchet MS';
        }


        .table {
            width: 75%;
            border: 2px solid black;
            border-radius: 5px;
            font-family: 'Trebuchet MS';
            background-color: floralwhite;
        }

        .auto-style2 {
            width: 103px;
        }

        .auto-style3 {
            width: 347px;
        }

        .auto-style5 {
            margin-left: 0px;
        }

        .auto-style7 {
            width: 207px;
            margin-right: 0px;
        }

        .auto-style8 {
            width: 103px;
            height: 37px;
        }

        .auto-style9 {
            width: 207px;
            margin-right: 0px;
            height: 37px;
        }

        .auto-style10 {
            width: 103px;
            height: 102px;
        }

        .auto-style11 {
            width: 207px;
            margin-right: 0px;
            height: 102px;
        }

        .auto-style12 {
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <br />
    <br />
    <table class="table">
        <tr>
            <td class="auto-style12" colspan="3">
                <h1>LOGIN</h1>
                &nbsp;</td>
            <td rowspan="4">
                <asp:Image ID="imgAdmin" runat="server" Height="398px" ImageUrl="~/Images/AdminLogo.png" Width="417px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="lblAdminId" runat="server" Text="User Id:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="tbAdminId" runat="server" CssClass="auto-style5"></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Password:</td>
            <td class="auto-style7">
                <asp:TextBox ID="tbAdminPwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style7">
                <asp:Label ID="lblCheck" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">
                <asp:Button ID="btnLogin" runat="server" Text="Login" Width="69px" OnClick="btnLogin_Click" />
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
    </table>

    <br />

    <br />

</asp:Content>

