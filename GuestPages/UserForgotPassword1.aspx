<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="UserForgotPassword1.aspx.cs" Inherits="UserForgotPassword1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        h1{
            text-align: center;
        }
        .lblEmail{
            text-align: center;
        }
        .textbox{
            text-align: center;
        }
        .Reset{
            text-align: center;
        }
        .Message{
            text-align: center;
        }
        .buttonEmail{
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>FORGOT PASSWORD</h1>
    <div class="lblEmail"><asp:Label ID="lblUserEmail" runat="server" Text="Email:"></asp:Label></div>
&nbsp;<div class="textbox"><asp:TextBox ID="tbUserEmail" runat="server" Height="22px" Width="240px" TextMode="Email" placeholder="someone@example.com"></asp:TextBox>
        <br />
        <asp:Label ID="lbl_Message" runat="server"></asp:Label>
    </div>
    <br />
    <br />
    <div class="Reset"><asp:Button ID="btnEmail" runat="server" Height="41px" Text="Send Me Reset Insructions" OnClick="btnEmail_Click" /></div>
    <br />
    <div class="Message"><asp:Label ID="lblVerify" runat="server" Text="No code/Code expired?"></asp:Label>&nbsp;<asp:LinkButton ID="btnResendEmail" runat="server" OnClick="btnResendEmail_Click">Resend Email</asp:LinkButton></div>
&nbsp;<div class="buttonEmail">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
    <br />

</asp:Content>

