<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="UserVerificationPage.aspx.cs" Inherits="UserVerificationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css">
        h1{
            text-align: center;
            font-weight: bold;
            font-family: 'Trebuchet MS';
        }
        .emailBtn{
            text-align: center;
            font-style: italic;
            font-family: 'Trebuchet MS';
        }
        p{
            text-align: center;
            font-style: italic;
            font-family: 'Trebuchet MS';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Thank you for signing up!</h1>
    <p>You have now successfully created an account with us. <br />We now need to very your account. <br />Please follow the instructions sent in you email to complete your registration.</p>
    <div class="emailBtn">
        <asp:LinkButton ID="btnResendEmail" runat="server" OnClick="btnResendEmail_Click">Resend Email</asp:LinkButton>
    </div>
    <asp:LinkButton ID="btnUserLogin" runat="server" Text="User Login" PostBackUrl="~/GuestPages/UserLogin.aspx"></asp:LinkButton>
    <br />
</asp:Content>

