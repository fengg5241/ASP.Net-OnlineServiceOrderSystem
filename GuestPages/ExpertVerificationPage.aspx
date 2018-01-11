<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ExpertVerificationPage.aspx.cs" Inherits="ExpertVerificationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        h1{
            text-align: center;
        }
        p{
            text-align: center;
        }
        .emailBtn{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <h1>Thank you for signing up!</h1>
    <p>An email has been sent to you for more details of your upcoming scheduled meeting with us. <br />Please wait for the response from our administrator</p>
    <div class="emailBtn">
        <asp:LinkButton ID="btnResendEmail" runat="server" OnClick="btnResendEmail_Click">Resend Email</asp:LinkButton>
    </div>
    <asp:LinkButton ID="btnExpertLogin" runat="server" Text="Expert Login" PostBackUrl="~/GuestPages/ExpertLogin.aspx"></asp:LinkButton>
    <br />
</asp:Content>

