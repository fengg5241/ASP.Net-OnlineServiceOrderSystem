<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="PaypalConfirmation.aspx.cs" Inherits="PaypalConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Redirecting...</title>
    <meta http-equiv="Refresh" content="5; url=Receipt.aspx" />
    <style type="text/css">
        #confirmation{
            margin-left:30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class ="body" id="confirmation">
    <h3>Thank You for Your Purchase via Paypal !</h3>
    <p>You are being redirected to your receipt.</p>
    <p>Please click <a runat="server" href="~/UserPages/Receipt.aspx" >here</a> if you are not redirected within 5 seconds.</p>
    </div>
</asp:Content>

