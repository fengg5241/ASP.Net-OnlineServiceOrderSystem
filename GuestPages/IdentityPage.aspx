<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="IdentityPage.aspx.cs" Inherits="IdentityPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .h1{
            text-align: center;
            color: white;
            font-family: 'Century Gothic';
        }
        .Buttons{
            text-align: center;
        }
        .auto-style4 {
            width: 909px;
        }
        .h11{
            text-align: center;
            color: white;
            font-family: 'Century Gothic';
            font-size: 100px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="login">
    <fieldset class="auto-style4">
        <div class="logo">
        <asp:Image ID="logo" runat="server" ImageUrl="~/Images/loginlogo.png" Width="600px"/>
        </div>
      <h1 class="h1">You are an:</h1>
        <br />
        <div class="Buttons">
        <asp:Button ID="btnUser" runat="server" Height="93px" OnClick="btnUser_Click" Text="User" Width="236px" BackColor="Transparent" BorderColor="White" Font-Size="35px" ForeColor="White" Font-Names="Century Gothic" />
        <asp:Button ID="btnExpert" runat="server" Height="93px" OnClick="btnExpert_Click" Text="Expert" Width="237px" BackColor="Transparent" BorderColor="White" Font-Size="35px" ForeColor="White" Font-Names="Century Gothic"/>
        <asp:Button ID="btnAdmin" runat="server" Height="93px" OnClick="btnAdmin_Click" Text="Administrator" Width="240px" BackColor="Transparent" BorderColor="White" Font-Size="35px" ForeColor="White" Font-Names="Century Gothic"/>
    </fieldset>
        </div>
    <div class="about">
        <fieldset class="auto-style4">
        <h1 class="h11">About Us</h1>
        </fieldset>
    </div>
    <div class="situated">
          <fieldset class="auto-style4">
        <h1 class="h11">Locations</h1>
        </fieldset>
    </div>
</asp:Content>

