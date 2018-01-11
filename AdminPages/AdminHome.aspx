<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .table{
            text-align: center;
            width: 100%;
            border: 2px solid black;
            border-radius: 5px;
        }
        h3{
            text-align: center;
        }
        p{
            text-align: center;
        }
        .Button1{
            font-family: 'Trebuchet MS';
            font-weight: bold;
            font-size: 20px;
            padding: 12px 28px;
            border-radius: 12px;
        }
        .Button2{
            font-family: 'Trebuchet MS';
            font-weight: bold;
            font-size: 20px;
            padding: 12px 28px;
            border-radius: 12px;
        }
       
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            height: 37px;
            text-align: center;
        }
       
        .auto-style6 {
            width: 177px;
        }
        .auto-style7 {
            height: 37px;
            width: 177px;
            text-align: center;
        }
        .auto-style8 {
            height: 37px;
            width: 173px;
            text-align: center;
        }
        .auto-style9 {
            width: 173px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table class="table">
        <tr>
            <td class="auto-style4" colspan="3">
                <h1>Welcome Admin!</h1>
                <h4>What would you like to do today?</h4>
                <div class="Button1">
&nbsp;<asp:Button ID="btnManageExp" runat="server" BackColor="#FF66FF" Text="Manage Expert" OnClick="btnManageExp_Click" />
                    </div>
                <div class="Button2">
                &nbsp;<asp:Button ID="btnManageUsers" runat="server" BackColor="#FF9966" Text="Manage Users" OnClick="btnManageUsers_Click" />

                </div>
                <br />
            </td>
        </tr>
     
    </table>

</asp:Content>

