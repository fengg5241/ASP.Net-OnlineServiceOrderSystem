<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ExpertVerifyAccount.aspx.cs" Inherits="ExpertVerifyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        p{
            text-align: center;
        }
        .LinkButton{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Account Activation Successful</h1>
    <p>
        Your account has been successfully activated, you may now login.</p>
    <div class="LinkButton">
        <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click">Click here to Login</asp:LinkButton>
    </div>
    <br />
</asp:Content>

